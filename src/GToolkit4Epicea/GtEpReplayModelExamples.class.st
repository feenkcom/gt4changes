Class {
	#name : #GtEpReplayModelExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #private }
GtEpReplayModelExamples class >> removeTestClasses [

	EpMonitor disableDuring:
		[ #(#GtEpReplayModelExamplesCheck) do: [ :each |
			self class environment removeClassNamed: each ].
		self class environment organization
			removeCategory: #GtEpReplayModelExamplesCheck ].
]

{ #category : #accessing }
GtEpReplayModelExamples class >> testDataRoot [

	^ FileLocator gtResource 
		/ 'feenkcom/gt4changes/data'
		/ self name.
]

{ #category : #private }
GtEpReplayModelExamples >> checkImageModelWithData01: aGtReplayImageModel [
	"Check the behavior of the supplied image model matches expectations."
	| behavior method classSide |

	self assert: aGtReplayImageModel behaviors size equals: 1.
	behavior := aGtReplayImageModel classOrTraitNamed: #GtEpReplayModelExamplesCheck.
	self deny: behavior hasCommentEntry.
	self assert: behavior package name equals: #GtEpReplayModelExamplesCheck.
	method := behavior methodAt: #instanceMethod1.
	self assert: method protocol equals: #accessing.
	self assert: method sourceCode isNotEmpty.
	self assert: ((behavior methodsInProtocol: #accessing) collect: #selector) 
		equals: #(#instanceMethod1).

	classSide := behavior classSide.
	method := classSide methodAt: #classMethod1.
	self assert: method protocol equals: #accessing.
	self assert: method sourceCode isNotEmpty.
	self assert: ((classSide methodsInProtocol: #accessing) collect: #selector) 
		equals: #(#classMethod1).
]

{ #category : #examples }
GtEpReplayModelExamples >> classAddition [
	<gtExample>
	<return: #GtEpReplayModelExamples>
	| fileReference entries epLog visitor image behavior history |
	fileReference := GtEpLogEnumeratorExamples testDataRoot / 'testClass01'.
	self
		assert: fileReference resolve exists
		description: [ fileReference fullName , ' not found' ].
	epLog := GtEpiceaCompositeLog forAllInStore: fileReference.
	entries := epLog entries.
	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: entries.
	image := visitor image.
	self assert: image behaviors size equals: 1.
	behavior := image classOrTraitNamed: #ATestClass.
	history := behavior entries.
	self assert: behavior methods size equals: 6
]

{ #category : #examples }
GtEpReplayModelExamples >> imageModelChangesOnly [
	"Check the behavior of the image model when there are only changes."

	<gtExample>
	<return: #GtEpReplayImageModel>
	| fileReference entries epLog visitor |
	self deny: (self class environment includesKey: #GtEpReplayModelExamplesCheck).
	fileReference := self class testDataRoot / 'data01'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo.ombu'.
	self
		assert: fileReference resolve exists
		description: [ fileReference fullName , ' not found' ].
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: entries.
	self checkImageModelWithData01: visitor image.
	^ visitor image
]

{ #category : #examples }
GtEpReplayModelExamples >> imageModelInSystem [
	"Check the behavior of the image model when there are only changes."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpReplayImageModel>
	| fileReference entries epLog visitor |
	self deny: (self class environment includesKey: #GtEpReplayModelExamplesCheck).
	fileReference := self class testDataRoot / 'data01'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo.ombu'.
	self
		assert: fileReference resolve exists
		description: [ fileReference fullName , ' not found' ].
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	EpMonitor
		disableDuring: [ entries do: [ :each | each content applyCodeChange ] ].
	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: entries.
	self checkImageModelWithData01: visitor image.
	^ visitor image
]

{ #category : #examples }
GtEpReplayModelExamples >> inImageModelHasCorrectSuperclassOnRename [
	"Check the behavior of the image model when we rename a superclass"

	<gtExample>
	<return: #GtEpReplayImageModel>
	| fileReference entries epLog visitor model superclassModel subclassModel |
	self deny: (self class environment includesKey: #GtEpReplayModelExamplesCheck).
	fileReference := GtEpEventSequencerExamples testDataRoot / 'Issue3398'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu'.
	self
		assert: fileReference resolve exists
		description: [ fileReference fullName , ' not found' ].
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: entries.
	model := visitor image.

	self assert: model behaviors size equals: 2.
	superclassModel := model classOrTraitNamed: #Issue3398RootClassRenamed.
	subclassModel := model classOrTraitNamed: #Issue3398Subclass.

	self assert: subclassModel superclassName equals: #Issue3398RootClassRenamed.

	^ visitor image
]

{ #category : #accessing }
GtEpReplayModelExamples >> removeTestClasses [

	self class removeTestClasses
]
