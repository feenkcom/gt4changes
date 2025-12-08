Class {
	#name : #GtEpiceaChangedMethodSelectorsVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'changedSelectorsByClassName'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaChangedMethodSelectorsVisitor >> changedSelectorsByClassName [
	^ changedSelectorsByClassName ifNil: [
		changedSelectorsByClassName := OrderedDictionary new ]
]

{ #category : #visitor }
GtEpiceaChangedMethodSelectorsVisitor >> visitEvent: aChange [
	"Ignore all events that reach this point"
]

{ #category : #visitor }
GtEpiceaChangedMethodSelectorsVisitor >> visitMethodChange: aChange [
	| changesSelectors| 
	changesSelectors := self changedSelectorsByClassName 
		at: aChange behaviorAffectedName
		ifAbsentPut: [ Set new ].
	changesSelectors add: aChange methodAffectedSelector
]
