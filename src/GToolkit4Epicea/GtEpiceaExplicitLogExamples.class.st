Class {
	#name : #GtEpiceaExplicitLogExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #accessing }
GtEpiceaExplicitLogExamples >> simpleLog [
	<gtExample>
	| log |
	log := GtEpiceaExplicitLog on: {}.
	
	self assert: log name equals: 'Explicit log on 0 entries'.
	self assert: log entries size equals: 0.
	
	^ log
]
