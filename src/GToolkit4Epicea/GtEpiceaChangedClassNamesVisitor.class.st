Class {
	#name : #GtEpiceaChangedClassNamesVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'changedClassNames'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #adding }
GtEpiceaChangedClassNamesVisitor >> addClassNamed: aClassName [
	aClassName ifNil: [ ^ self ].
	
	self changedClassNames 
		add: (self processClassName: aClassName)
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> changedClassNames [
	^ changedClassNames ifNil: [ 
		changedClassNames := Set new]
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> processClassName: aClassName [
	^ aClassName removeSuffix: ' class'
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitBehaviorChange: aChange [
	self addClassNamed: aChange  behaviorAffectedName 
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitBehaviorNameChange: aChange [
	self addClassNamed: aChange  oldName.
	
	^ self visitBehaviorChange: aChange
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitEvent: aChange [
	"Ignore all events that reach this point"
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitMethodChange: aChange [
	self addClassNamed: aChange  behaviorAffectedName 
]
