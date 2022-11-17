Class {
	#name : #GtEpiceaChangeListModelExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceaChangeListModelExamples >> modelWithLog [
	<gtExample>
	| model |
	model := self simpleModel.
	
	model log: GtEpiceaLogExamples new simpleLog.
	
	self assert: model filterDescriptors size > 0.
	
	^ model
]

{ #category : #examples }
GtEpiceaChangeListModelExamples >> simpleModel [
	<gtExample>
	| model |
	model := GtEpiceaChangeListModel new.
	
	self assert: model allStream size wait equals: 0.
	self assert: model availableProvider itemCount equals: 0.
	self assert: model selectedCodeEvents size equals: 0.
	
	^ model
]
