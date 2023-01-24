"
A GtEpReplayMethodModel models the state of an individual method.
"
Class {
	#name : #GtEpReplayMethodModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'isRemoved',
		'selector',
		'behaviorModel'
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

	^ behaviorModel behaviorAffectedName.
]

{ #category : #accessing }
GtEpReplayMethodModel >> behaviorModel [
	^ behaviorModel
]

{ #category : #accessing }
GtEpReplayMethodModel >> behaviorModel: anObject [
	behaviorModel := anObject
]

{ #category : #accessing }
GtEpReplayMethodModel >> currentDefinition [

	^ (self class environment classOrTraitNamed: behaviorModel name) methodNamed: selector
]

{ #category : #testing }
GtEpReplayMethodModel >> exists [

	^ self isRemoved not and: 
		[ entries isNotEmpty or: 
			[ self existsInSystem ] ]
]

{ #category : #testing }
GtEpReplayMethodModel >> existsInSystem [

	^ (self class environment classOrTraitNamed: behaviorModel name)
		ifNil: [ false ]
		ifNotNil: [ :behavior | behavior includesSelector: selector ]
]

{ #category : #initialization }
GtEpReplayMethodModel >> initialize [

	super initialize.
	isRemoved := false.
]

{ #category : #testing }
GtEpReplayMethodModel >> isMeta [

	^ behaviorModel isMeta
]

{ #category : #testing }
GtEpReplayMethodModel >> isRemoved [
	"Answer a boolean indicating whether the receiver has been removed from the system."

	^ isRemoved
]

{ #category : #accessing }
GtEpReplayMethodModel >> methodAffected [

	^ entries
		ifEmpty: [ self currentDefinition ]
		ifNotEmpty: [ self latestEntry methodAffected ]
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
GtEpReplayMethodModel >> protocol [

	^ entries
		ifEmpty: [ self currentDefinition protocol ]
		ifNotEmpty: [ self latestEntry content methodAffected protocol ].
]

{ #category : #accessing }
GtEpReplayMethodModel >> selector [

	^ selector.
]

{ #category : #accessing }
GtEpReplayMethodModel >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
GtEpReplayMethodModel >> sourceCode [

	self isRemoved ifTrue: [ ^ '' ].
	^ entries 
		ifEmpty: [ self currentDefinition sourceCode ]
		ifNotEmpty: [ self latestEntry content methodAffected sourceCode ].
]
