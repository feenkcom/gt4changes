"
A GtEpReplayMethodModel models the state of an individual method.
"
Class {
	#name : #GtEpReplayMethodModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'isRemoved'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayMethodModel >> accept: aVisitor [

	aVisitor visitMethodReplay: self
]

{ #category : #adding }
GtEpReplayMethodModel >> addMethodAddition: anOmEntry [

	self addMethodChange: anOmEntry.
	isRemoved := false.
]

{ #category : #adding }
GtEpReplayMethodModel >> addMethodChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayMethodModel >> addMethodModification: anOmEntry [

	self addMethodChange: anOmEntry.
	isRemoved := false.
]

{ #category : #adding }
GtEpReplayMethodModel >> addMethodRemoval: anOmEntry [

	self addMethodChange: anOmEntry.
	isRemoved := true.
]

{ #category : #accessing }
GtEpReplayMethodModel >> behaviorAffectedName [ 

	^ self latestEntry content behaviorAffectedName.
]

{ #category : #initialization }
GtEpReplayMethodModel >> initialize [

	super initialize.
	isRemoved := false.
]

{ #category : #testing }
GtEpReplayMethodModel >> isRemoved [
	"Answer a boolean indicating whether the receiver has been removed from the system."

	^ isRemoved
]

{ #category : #printing }
GtEpReplayMethodModel >> printOn: aStream [

	entries ifEmpty: [ ^ super printOn: aStream ].
	aStream
		<< 'Replay: ';
		<< self behaviorAffectedName;
		<< '>>';
		<< self selector.
]

{ #category : #accessing }
GtEpReplayMethodModel >> selector [

	^ self latestEntry content selector.
]
