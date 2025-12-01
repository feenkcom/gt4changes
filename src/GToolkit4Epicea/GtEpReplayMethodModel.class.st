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
	#category : 'GToolkit4Epicea-Sequencer'
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
GtEpReplayMethodModel >> asRingDefinition [

	^ self methodAffected asRingDefinition.
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

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtEntityLabel [
	^ String streamContents: [ :aStream |
		aStream
			<< self behaviorAffectedName;
			<< '>>';
			<< self selector.]
]

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'Source';
		priority: 20;
		object: [ self methodAffected ];
		view: #gtSourceFor:
]

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtViewChangeDescriptionElements [
	^ self entries last gtViewChangeDescriptionElements
]

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtViewChangeHistoryChildren [
	^ entries sorted: #gtTime descending
]

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtViewChangeIcon [
	self isRemoved ifTrue: [
		^ self existsInSystem 
			ifTrue: [ Smalltalk ui icons iconNamed: #changeRemoveIcon ] 
			ifFalse: [
				Smalltalk ui icons iconNamed: #windowMinimizeInactive ] ].
	
	self existsInSystem ifTrue: [
		^ Smalltalk ui icons iconNamed: #changeUpdate ].
	
	^ Smalltalk ui icons iconNamed: #changeAddIcon
]

{ #category : #'gt - extensions' }
GtEpReplayMethodModel >> gtViewLatestChangeTime [
	^ entries last gtViewLatestChangeTime
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
		ifNotEmpty: [ self latestEntry content methodAffected ]
]

{ #category : #accessing }
GtEpReplayMethodModel >> omEntryFor: anEpCodeChange [

	^ behaviorModel omEntryFor: anEpCodeChange
]

{ #category : #accessing }
GtEpReplayMethodModel >> package [
	| protocol |

	protocol := self protocol.
	^ protocol first = $*
		ifTrue: [ RPackageOrganizer default packageMatchingExtensionName: protocol allButFirst ]
		ifFalse: [ behaviorModel package ]
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
		ifEmpty: [ self currentDefinition protocolName ]
		ifNotEmpty: [ self latestEntry content methodAffected protocolName ].
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
