Class {
	#name : #GtEpiceCompositeLogExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #accessing }
GtEpiceCompositeLogExamples >> simpleLog [
	<gtExample>
	| log |
	log := GtEpiceaCompositeLog new.
	
	self assert: log name equals: '0 logs'.
	self assert: log isFrozen equals: false.
	self assert: log entries size equals: 0.
	self should: [ log freeze ] raise: Error.
	
	^ log
]

{ #category : #accessing }
GtEpiceCompositeLogExamples >> simpleLogFromStore [
	<gtExample>
	| log |
	log := GtEpiceaCompositeLog forAllInSessionStore.
	
	self assert: log logs size > 0.
	
	^ log
]
