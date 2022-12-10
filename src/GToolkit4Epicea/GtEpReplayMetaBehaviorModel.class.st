Class {
	#name : #GtEpReplayMetaBehaviorModel,
	#superclass : #GtEpReplayAbstractBehaviorModel,
	#instVars : [
		'instanceSide'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayMetaBehaviorModel >> accept: aVisitor [

	aVisitor visitMetaBehaviorReplay: self
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> behaviorAffectedName [

	^ instanceSide behaviorAffectedName, ' class'
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> classSide [

	^ self
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> instanceSide [

	^ instanceSide
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> instanceSide: anObject [

	instanceSide := anObject
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> isRemoved [

	^ self instanceSide isRemoved
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> printOn: aStream [

	instanceSide ifNil: [ ^ super printOn: aStream ].
	aStream
		<< self behaviorAffectedName;
		<< ' model'.
]
