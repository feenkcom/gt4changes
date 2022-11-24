Class {
	#name : #GtEpiceCompositeLogExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceCompositeLogExamples >> simpleLog [
	<gtExample>
	| log |
	log := GtEpiceaCompositeLog new.
	
	self assert: log name equals: '0 logs'.
	self assert: log entries size equals: 0.
	
	^ log
]

{ #category : #examples }
GtEpiceCompositeLogExamples >> simpleLogFromStore [
	<gtExample>
	<noTest>
	"this only works if we have logs; it does not work with, e.g. --detachChangesFromFileSystem"
	"it’s not required for testing, and is mostly here for documentation purposes"
	| log |
	log := GtEpiceaCompositeLog forAllInSessionStore.
	
	self assert: log logs size > 0.
	
	^ log
]
