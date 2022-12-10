Class {
	#name : #GtEpReplayModelExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpReplayModelExamples >> classAddition [
	<gtExample>
	| fileReference entries epLog visitor image behavior history |

	fileReference := GtEpLogEnumeratorExamples testDataRoot / 'testClass01'.
	self assert: fileReference resolve exists
		description: [ fileReference fullName, ' not found' ].
	epLog := GtEpiceaCompositeLog forAllInStore: fileReference.
	entries := epLog entries.
	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: entries.
	image := visitor image.
	self assert: image behaviors size equals: 1.
	behavior := image classOrTraitNamed: #ATestClass.
	history := behavior entries.
	self assert: behavior methods size equals: 6.
]
