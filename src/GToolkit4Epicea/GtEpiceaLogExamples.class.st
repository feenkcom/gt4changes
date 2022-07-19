Class {
	#name : #GtEpiceaLogExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #accessing }
GtEpiceaLogExamples >> frozenLog [
	<gtExample>
	| log |
	log := self simpleLog.

	log freeze.

	self assert: log isFrozen.
	self should: [ log addEntryWith: nil tags: nil ] raise: Error.

	^ log
]

{ #category : #accessing }
GtEpiceaLogExamples >> simpleLog [
	<gtExample>
	| log |
	log := GtEpiceaLog new.
	
	self assert: log name equals: ''.
	self assert: log isFrozen equals: false.
	self assert: log entries size equals: 0.
	
	^ log
]

{ #category : #accessing }
GtEpiceaLogExamples >> simpleLogFromStore [
	<gtExample>
	| logs |
	logs := GtEpiceaLog allInSessionStore.
	
	self assert: logs size > 0.
	
	^ logs first
]
