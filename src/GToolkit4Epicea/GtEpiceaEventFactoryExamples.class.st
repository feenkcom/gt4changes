Class {
	#name : #GtEpiceaEventFactoryExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceaEventFactoryExamples >> addRemoveClassProtocol [
	"Demonstrate generating the factory code to add and remove a class protocol"
	<gtExample>
	| testProtocol sourceEpEntries visitor sourceCode generatedEpEvents |

	testProtocol := #factoryExampleTestProtocol.
	self deny: (self class protocols includes: testProtocol).
	sourceEpEntries := self epEntriesFrom: 
		[ self
			forPharo12: [ self class organization addProtocol: testProtocol ] 
			forPharo11AndPharo10: [ self class organization addCategory: testProtocol ].
		self class removeProtocol: testProtocol ].
	self assert: sourceEpEntries size equals: 2.
	visitor := GtEpiceaFactoryEventCodeVisitor
			selector: #classAddModifyRenameRemoveFactoryMethod
			entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEvents := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEvents equals: sourceEpEntries
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> addRemoveInstanceProtocol [
	"Demonstrate generating the factory code to add and remove an instance protocol"
	<gtExample>
	| testProtocol sourceEpEntries visitor sourceCode generatedEpEvents |

	testProtocol := #factoryExampleTestProtocol.
	self deny: (self class protocols includes: testProtocol).
	sourceEpEntries := self epEntriesFrom: 
		[ self
			forPharo12: [ self class organization addProtocol: testProtocol ] 
			forPharo11AndPharo10: [ self class organization addCategory: testProtocol ].
		self class removeProtocol: testProtocol ].
	self assert: sourceEpEntries size equals: 2.
	visitor := GtEpiceaFactoryEventCodeVisitor
			selector: #classAddModifyRenameRemoveFactoryMethod
			entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEvents := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEvents equals: sourceEpEntries
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> assertEntries: generatedEpEntries equals: sourceEpEntries [

	self assert: generatedEpEntries size equals: sourceEpEntries size.
	1 to: generatedEpEntries size do: [ :i |
		self assertEntry: (generatedEpEntries at: i)
			equals: (sourceEpEntries at: i) ].
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> assertEntry: generatedEpEntry equals: sourceEpEntry [ 
	"Check the equality of the supplied OmEntries"
	| generated source visitor |

	self assert: generatedEpEntry tags
		equals: sourceEpEntry tags.

	source := sourceEpEntry content.
	generated := generatedEpEntry content.
	self assert: generated class equals: source class.
	visitor := GtEpEventEqualityVisitor new actualEvent: generated.
	source accept: visitor.
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> classAddModifyRenameCategoryRemove [
	"Demonstrate generating the factory code to produce a class definition lifecycle"
	<gtExample>
	| sourceEpEntries visitor sourceCode generatedEpEvents classRemovedEntries |

	EpMonitor current
		disableDuring: [ 
			self removePackageNamed: #'GToolkit4EpiceaRename-Examples'.
			self removePackageNamed: #GToolkit4EpiceaRename ].
	sourceEpEntries := self
			epEntriesFrom: [ self class compiler
					evaluate: 'Object subclass: #GtEpiceaEventFactoryExamplesExampleClass
	instanceVariableNames: ''a b c''
	classVariableNames: ''A1 B2''
	package: ''GToolkit4Epicea-Examples'''.
				#GtEpiceaEventFactoryExamplesExampleClass asClass comment: 'comment1'.
				self class compiler
					evaluate: 'Object subclass: #GtEpiceaEventFactoryExamplesExampleClass
	instanceVariableNames: ''a b c d''
	classVariableNames: ''A1 B2''
	package: ''GToolkit4Epicea-Examples'''.
				self class compiler
					evaluate: 'GtEpiceaEventFactoryExamplesExampleClass rename: #GtEpiceaEventFactoryExamplesExampleClass2'.
				#GtEpiceaEventFactoryExamplesExampleClass2 asClass comment: 'comment2'.
				#GtEpiceaEventFactoryExamplesExampleClass2 asClass
					category: #'GToolkit4EpiceaRename-Examples'.
				#GtEpiceaEventFactoryExamplesExampleClass2 asClass removeFromSystem.
				self assert: (self packageNamed: #'GToolkit4EpiceaRename-Examples' ifAbsent: [ #() ]) isEmpty.
				self removePackageNamed: #'GToolkit4EpiceaRename-Examples' ].	"Depending on the order, the package name may have been cached"
	self assert: (sourceEpEntries size between: 8 and: 12).	"Because the generated events involve a class actually being removed, the class ends up being obsolete.
	Patch the remove event to use the same class as the add event."
	classRemovedEntries := sourceEpEntries select: [ :entry | entry content isEpClassRemoval ].
	self assert: classRemovedEntries size equals: 1.
	classRemovedEntries first content
		initializeClassRemoved: sourceEpEntries first content classAdded.
	visitor := GtEpiceaFactoryEventCodeVisitor
			selector: #classAddModifyRenameRemoveFactoryMethod
			entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEvents := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEvents equals: sourceEpEntries
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> compileAndEvaluate: sourceCode [
	| selector result |

	EpMonitor disableDuring: [ selector := self class compile: sourceCode classified: #volatile ].
	result := self perform: selector.
	EpMonitor disableDuring: [ self class removeSelector: selector ].
	^ result entries.
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> epEntriesFrom: aBlock [
	"Answer the Epicea events generated by evaluating the supplied block.
	The default EpMonitor is disabled so that the events aren't written to disk."
	| epMonitor |

	epMonitor := EpMonitor newWithLog: 
		(EpLog newWithStore: OmMemoryStore new).
	epMonitor enable.
	[ EpMonitor disableDuring: [ aBlock value ] ]
		ensure: [ epMonitor disable ].
	^ Array streamContents: [ :stream |
		epMonitor log store entriesDo: [ :entry |
			stream nextPut: entry ] ].
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> methodAddModifyRemove [
	"Demonstrate generating the factory code to produce the supplied method modification event"
	<gtExample>
	| sourceEpEntries visitor sourceCode generatedEpEvents |

	sourceEpEntries := self epEntriesFrom: 
		[ self class 
			compile: 'test1 ^ 42';
			compile: 'test1 ^ 43';
			removeSelector: #test1 ].
	"Allow for differences between Pharo11 and Pharo12"
	self assert: (sourceEpEntries size between: 3 and: 4).
	visitor := GtEpiceaFactoryEventCodeVisitor
		selector: #methodModificationFactoryMethod
		entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEvents := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEvents equals: sourceEpEntries.
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> packageNamed: aSymbol [

	^ self forPharo12: [ PackageOrganizer default packageNamed: aSymbol ]
		forPharo11AndPharo10: [ RPackageOrganizer default packageNamed: aSymbol ]
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> packageNamed: aSymbol ifAbsent: aBlock [

	^ self 
		forPharo12: [ PackageOrganizer default packageNamed: aSymbol ifAbsent: aBlock ] 
		forPharo11AndPharo10: [ RPackageOrganizer default packageNamed: aSymbol ifAbsent: aBlock ].
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> packageRegisterAddRenameRemove [
	"Demonstrate the lifecycle of a package"
	<gtExample>
	| initialPackageName renamedPackageName sourceEpEntries visitor sourceCode generatedEpEntries |

	self forPharo12: [ ^ self ] forPharo11AndPharo10: [].
	initialPackageName := #PackageOne.
	renamedPackageName := #RenamedOne.
	sourceEpEntries := {
		EpCategoryRegistration named: initialPackageName.
		EpCategoryAddition named: initialPackageName.
		EpCategoryRename oldName: initialPackageName newName: renamedPackageName.
		EpCategoryRemoval named: renamedPackageName. } collect: [ :epEvent | | omEntry |
			omEntry := OmEntry content: epEvent.
			omEntry tags
				at: #time put: DateAndTime now;
				at: #author put: self class name asString.
			omEntry ].
	visitor := GtEpiceaFactoryEventCodeVisitor
		selector: #packageRegisterAddRenameRemoveMethod
		entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEntries := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEntries equals: sourceEpEntries.
]

{ #category : #'private - helpers' }
GtEpiceaEventFactoryExamples >> removePackageNamed: aSymbol [

	self forPharo12:
		[ PackageOrganizer default removePackage: aSymbol]
	forPharo11AndPharo10:
		[ RPackageOrganizer default 
			unregisterPackageNamed: aSymbol;
			removePackageNameFromCache: aSymbol ]
]

{ #category : #examples }
GtEpiceaEventFactoryExamples >> traitAddModifyRenameRemove [
	"Demonstrate generating the factory code to produce a trait definition lifecycle"

	<gtExample>
	| sourceEpEntries visitor sourceCode generatedEpEvents |
	sourceEpEntries := self
			epEntriesFrom: [ self class compiler
					logged: true;
					source: 'Trait named: #GtEpiceaEventFactoryExamplesExampleTrait
	instanceVariableNames: ''a b c''
	package: ''GToolkit4Epicea-Examples''';
					evaluate.
				(self class environment
					classOrTraitNamed: #GtEpiceaEventFactoryExamplesExampleTrait)
					comment: 'comment1'.
				self class compiler
					logged: true;
					source: 'Trait named: #GtEpiceaEventFactoryExamplesExampleTrait
	instanceVariableNames: ''a b c d''
	package: ''GToolkit4Epicea-Examples''';
					evaluate.
				self class compiler
					logged: true;
					source: 'GtEpiceaEventFactoryExamplesExampleTrait rename: #GtEpiceaEventFactoryExamplesExampleTrait2';
					evaluate.
				(self class environment
					classOrTraitNamed: #GtEpiceaEventFactoryExamplesExampleTrait2)
					comment: 'comment2'.
				(self class environment
					classOrTraitNamed: #GtEpiceaEventFactoryExamplesExampleTrait2)
					removeFromSystem ].
	"Allow for differences in events between Pharo11 and Pharo12"
	self assert: (sourceEpEntries size between: 6 and: 8).
	"Because the generated events involve a trait actually being removed, the class ends up being obsolete.
	Patch the remove event to use the same class as the add event."
	sourceEpEntries last content
		initializeWithTrait: sourceEpEntries first content traitAdded.
	visitor := GtEpiceaFactoryEventCodeVisitor
			selector: #traitAddModifyRenameRemoveFactoryMethod
			entries: sourceEpEntries.
	sourceCode := visitor sourceCode.
	generatedEpEvents := self compileAndEvaluate: sourceCode.
	self assertEntries: generatedEpEvents equals: sourceEpEntries
]
