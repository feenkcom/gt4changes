"
Migrate GtEpEventSequencerExamples from using epicea files to use factory methods to generate the events.

Two basic steps:

1.  Convert the methods from using the epicea file to using the factory method.
    See {{gtMethod:GtEpiceaMigrateGt4Epicea class>>#convertFromOmbuToEntriesMethod}}.
2. Manually tidy up any failing examples.  E.g.:
    - the number of entries returned has changed, as non-functional entries are no longer generated.
    - any examples that use more than one ombu file will not have been converted correctly.
    - any examples that load the entries differently will not have been converted correctly.
"
Class {
	#name : #GtEpiceaMigrateGt4Epicea,
	#superclass : #Object,
	#category : #'EpiceaMigration-GToolkit4Epicea'
}

{ #category : #migration }
GtEpiceaMigrateGt4Epicea class >> convertFromOmbuToEntriesMethod [
	"Convert any methods that use ombu files to use the matching entries method"

	self new convertFromOmbuToEntriesMethod
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea class >> createEventMethod: selector from: aFileReference in: targetClass [
	"Create a class method named selector that generates the Epicea events in aFileReference.
	Used for creating a sequence of entries that can be input to the sequencer examples."
	| epLog visitor generatedEntries |

	epLog := EpLog fromFile: aFileReference.
	visitor := GtEpiceaFactoryEventCodeVisitor
		selector: selector
		entries: epLog entries
		sourceFile: aFileReference.
	targetClass class 
		compile: visitor sourceCode
		classified: #'example events'.
	generatedEntries := (targetClass perform: selector) entries.
	self assert: generatedEntries size = epLog entries size
		description: [ 'Failed to generate the same number of entries: {1} and {2}' format: { generatedEntries size. epLog entries size. } ].
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea class >> createEventMethodWithPriors: selector from: aFileReference in: targetClass [
	"Create a class method named selector that generates the Epicea events in aFileReference.
	Used for creating a sequence of entries that can be input to the sequencer examples."
	| epLog visitor |

	epLog := GtEpLogEnumerator fromFile: aFileReference.
	visitor := GtEpiceaFactoryEventCodeVisitor
		selector: selector
		entries: epLog priorEntriesFromHead reversed.
	targetClass class 
		compile: visitor sourceCode
		classified: #'example events'.
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea class >> entriesSelectorFor: exampleSelector [

	^ (((exampleSelector asString withoutSuffix: 'ForExport') withoutSuffix: 'InImage'), 'Entries') asSymbol
]

{ #category : #accessing }
GtEpiceaMigrateGt4Epicea class >> targetClass [

	^ GtEpEventSequencerExamples
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea class >> updatedSourceCode [
	"Answer a collection of all the new method source code.
	For debugging."

	^ self new updatedSourceCode
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea >> convertFromOmbuToEntriesMethod [
	"Convert any methods that use ombu files to use the matching entries method"

	self ombuExampleMethodsDo: [ :method |
		self updateOmbuWithMethodIn: method ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> entriesSelectorIn: ast [
	^ ast allChildren
		detect: [ :each | each isMessage and: [ #(entries priorEntriesFromHead) includes: each selector ] ]
		ifFound: [ :each | each selector ]
		ifNone: [ #entries ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> fileMessageIn: node [
	| bottomMessageNode topMessageNode |
	topMessageNode := node value.
	bottomMessageNode := topMessageNode allChildren
			detect: [ :each | each isMessage and: [ each selector = #testDataRoot ] ].
	bottomMessageNode receiver: (RBVariableNode named: #GtEpEventSequencerExamples).
	^ topMessageNode newSource
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> fileReferenceIn: node [

	^ self class evaluate:
		(self fileMessageIn: node)
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea >> generateEntriesForMethod: method [
	"Generate the entries method for the supplied example method"
	| fileReferenceNode ast fileReference entriesSelector createSelector |

	ast := RBParser parseMethod: method sourceCode.
	fileReferenceNode := ast allChildren
		detect: [ :each | each isAssignment and: [ each variable name = 'fileReference' ] ]
		ifNone: [ ^ nil ].

	fileReference := self fileReferenceIn: fileReferenceNode.
	entriesSelector := self entriesSelectorIn: ast.
	createSelector := entriesSelector = #priorEntriesFromHead
			ifTrue: [ #createEventMethodWithPriors:from:in: ]
			ifFalse: [ #createEventMethod:from:in: ].
	self class perform: createSelector withArguments: {
		self class entriesSelectorFor: method selector.
		fileReference.
		self class targetClass. }.
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> methodUsesOmbu: method [ 
	"Answer a boolean indicating whether the supplied method uses an OMBU file to retrieve EpEvents.
	A method is considered to use an ombu file if it has fileReference and epLog temporary variables"

	^ #(#fileReference #epLog) allSatisfy: [ :name |
		method ast temporaryNames includes: name ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> ombuExampleMethodsDo: aBlock [

	GtEpEventSequencerExamples methods
		select: [ :method |
			(method hasPragmaNamed: #gtExample) and:
			[ self methodUsesOmbu: method ] ]
		thenDo: aBlock 
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> removeEpLogAssignmentIn: ast [

	ast allChildren
		detect: [ :node | node isAssignment and: [ node variable name = #epLog ] ]
		ifFound: [ :node | ast body removeNode: node ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> removeFileReferenceAssertionIn: ast [ 

	ast allChildren
		detect: [ :node | 
			node isMessage and: 
			[ node selector = #exists and:
			[ node receiver name = #fileReference and:
			[ node parent isMessage and:
			[ node parent selector = #assert: and:
			[ node parent receiver isSelfVariable ] ] ] ] ] ]
		ifFound: [ :node | ast body removeNode: node parent ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> removeFileReferenceAssignmentIn: ast [ 

	ast allChildren
		detect: [ :node | node isAssignment and: [ node variable name = #fileReference ] ]
		ifFound: [ :node | ast body removeNode: node ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> removeTemporariesIn: ast [
	#(fileReference epLog)
		do: [ :aSymbol | ast body removeTemporaryNamed: aSymbol ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> replaceEntriesAssignmentIn: ast [
	| entriesSelector entriesMessageNode |

	entriesSelector := self class entriesSelectorFor: ast selector.
	entriesMessageNode := RBParser parseExpression: 'self class ', entriesSelector asString, ' entries.'.
	ast allChildren
		detect: [ :node | node isAssignment and: [ node variable name = #entries ] ]
		ifFound: [ :node | node value: entriesMessageNode ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> updateOmbuWithMethodIn: method [

	self generateEntriesForMethod: method.
	self class targetClass
		compile: (self updatedSourceCodeFor: method)
		classified: #examples.
]

{ #category : #migration }
GtEpiceaMigrateGt4Epicea >> updatedSourceCode [
	"Answer a collection of all the new method source code.
	For debugging."

	^ Array streamContents: [ :stream |
		self ombuExampleMethodsDo: [ :method |
			stream nextPut: (self updatedSourceCodeFor: method) ] ]
]

{ #category : #private }
GtEpiceaMigrateGt4Epicea >> updatedSourceCodeFor: method [
	| ast |

	ast := RBParser parseMethod: method sourceCode.
	self removeTemporariesIn: ast.
	self removeFileReferenceAssignmentIn: ast.
	self removeFileReferenceAssertionIn: ast.
	self removeEpLogAssignmentIn: ast.
	self replaceEntriesAssignmentIn: ast.
	^ ast newSource.
]
