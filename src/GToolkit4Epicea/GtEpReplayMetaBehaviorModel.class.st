Class {
	#name : #GtEpReplayMetaBehaviorModel,
	#superclass : #GtEpReplayAbstractBehaviorModel,
	#instVars : [
		'instanceSide'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayMetaBehaviorModel >> accept: aVisitor [

	aVisitor visitMetaBehaviorReplay: self
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> behaviorAffectedName [

	^ instanceSide behaviorAffectedName, (self isClass ifTrue: [ ' class' ] ifFalse: [ ' classTrait' ])
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> classSide [

	^ self
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> definesBehaviorInImage: aGtEpReplayImageModel [
	"Answer a boolean indicating whether the receiver defines its class / trait.
	I.e. are there entries which add the behavior."

	^ instanceSide definesBehaviorInImage: aGtEpReplayImageModel
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> exists [

	^ self instanceSide exists
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> hasDependentClassIn: anEnvironment [
	"Answer a boolean indicating whether the receiver has any dependent classes present in the supplied environment.
	For a class this means the superclass is present.
	Traits have no equivalent dependency."

	^ instanceSide hasDependentClassIn: anEnvironment
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> imageModel [

	^ instanceSide imageModel.
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
GtEpReplayMetaBehaviorModel >> isClass [

	^ instanceSide isClass
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> isMeta [

	^ true
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> isRemoved [

	^ self instanceSide isRemoved
]

{ #category : #testing }
GtEpReplayMetaBehaviorModel >> isTrait [

	^ instanceSide isTrait
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> name [

	^ instanceSide name, (self isClass ifTrue: [ ' class' ] ifFalse: [ ' classTrait' ])
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> omEntryFor: anEpCodeChange [

	^ instanceSide omEntryFor: anEpCodeChange.
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> package [

	^ instanceSide package
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> printOn: aStream [

	instanceSide ifNil: [ ^ super printOn: aStream ].
	aStream
		<< self behaviorAffectedName;
		<< ' model'.
]

{ #category : #accessing }
GtEpReplayMetaBehaviorModel >> selectors [
	"Answer the selectors defined by the receiver, including the current definition"
	| selectors |

	selectors := methods keys asSet.
	self class environment 
		at: instanceSide name
		ifPresent: [ :cls | selectors addAll: cls class selectors ].
	^ selectors
]
