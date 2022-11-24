Class {
	#name : #GtEpiceaLogExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceaLogExamples >> simpleLog [
	<gtExample>
	| log |
	log := GtEpiceaLog new.
	
	self assert: log name equals: ''.
	self assert: log entries size equals: 0.
	
	^ log
]

{ #category : #examples }
GtEpiceaLogExamples >> simpleLogFromStore [
	<gtExample>
	<noTest>
	"this only works if we have logs; it does not work with, e.g. --detachChangesFromFileSystem"
	"it’s not required for testing, and is mostly here for documentation purposes"
	| logs |
	logs := GtEpiceaLog allInSessionStore.
	
	self assert: logs size > 0.
	
	^ logs first
]
