"
A GtEpReplayMethodModel models the state of a behavior protocol addition and removal.
"
Class {
	#name : #GtEpReplayProtocolModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'isRemoved'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayProtocolModel >> accept: aVisitor [

	aVisitor visitProtocolReplay: self
]

{ #category : #adding }
GtEpReplayProtocolModel >> addProtocolAddition: anOmEntry [

	self addProtocolChange: anOmEntry.
	isRemoved := false.
]

{ #category : #adding }
GtEpReplayProtocolModel >> addProtocolChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayProtocolModel >> addProtocolRemoval: anOmEntry [

	self addProtocolChange: anOmEntry.
	isRemoved := true.
]

{ #category : #initialization }
GtEpReplayProtocolModel >> initialize [

	super initialize.
	isRemoved := false.
]

{ #category : #testing }
GtEpReplayProtocolModel >> isRemoved [
	"Answer a boolean indicating whether the receiver has been removed from the system."

	^ isRemoved
]

{ #category : #printing }
GtEpReplayProtocolModel >> printOn: aStream [

	entries ifEmpty: [ ^ super printOn: aStream ].
	aStream
		<< 'Replay protocol: ';
		<< self protocol.
]

{ #category : #accessing }
GtEpReplayProtocolModel >> protocol [

	^ self latestEntry content protocol
]
