"
A GtEpReplayBehaviorModel models the state of an individual behaviour, including its methods and their history and the latest comment.
"
Class {
	#name : #GtEpReplayBehaviorModel,
	#superclass : #GtEpReplayAbstractBehaviorModel,
	#instVars : [
		'name',
		'classSide',
		'comments',
		'previousLives',
		'previousNames'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayBehaviorModel >> accept: aVisitor [

	aVisitor visitBehaviorReplay: self
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorAddition: anOmEntry [

	self addBehaviorChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorCommentChange: anOmEntry [

	comments add: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorModification: anOmEntry [

	self addBehaviorChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorRemoval: anOmEntry [

	entries add: anOmEntry.
	previousLives add: self copy.
	self reset.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorRename: anOmEntry [

	entries add: anOmEntry.
	previousNames add: name.
	name := anOmEntry content newName asSymbol.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addTraitRemoval: anOmEntry [

	self addBehaviorRemoval: anOmEntry.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> behaviorAffectedName [

	^ name
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> classSide [

	^ classSide
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> comments [

	^ comments
]

{ #category : #ui }
GtEpReplayBehaviorModel >> gtCommentEntriesFor: aView [
	<gtView>

	^ aView list
		title: 'Comments';
		priority: 30;
		items: [ comments ];
		actionUpdateButton
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> gtPreviousLivesFor: aView [
	<gtView>
	
	^ aView list
		title: 'Previous Lives';
		priority: 40;
		items: [ previousLives ];
		actionUpdateButton
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> hasCommentEntry [

	^ comments isNotEmpty
]

{ #category : #initialization }
GtEpReplayBehaviorModel >> initialize [ 

	super initialize.
	previousLives := OrderedCollection new.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> instanceSide [

	^ self
]

{ #category : #testing }
GtEpReplayBehaviorModel >> isRemoved [
	"Answer a boolean indicating whether the receiver has been removed from the system."
	| isRemoved |

	isRemoved := entries isEmpty and: [ methods isEmpty ].
	isRemoved ifTrue: [ self assert: previousLives isNotEmpty ].
	^ isRemoved
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> latestCommentEntry [

	^ comments last
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> name [

	^ name
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> originalBehaviorNameAffected [
	"Answer the name of the receiver's behavior prior to any renames"

	entries
		detect: [ :entry | entry content isEpBehaviorNameChange ]
		ifFound: [ :entry | entry content oldName ]
		ifNone: [ entries last content behaviorAffectedName ].
]

{ #category : #copying }
GtEpReplayBehaviorModel >> postCopy [

	super postCopy.
	classSide instanceSide: self.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> previousLives [

	^ previousLives
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> previousNames [

	^ previousNames
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> printOn: aStream [

	name ifNil: [ ^ super printOn: aStream ].
	aStream
		<< name;
		<< ' model'.
]

{ #category : #private }
GtEpReplayBehaviorModel >> replayBehaviorRemovalOn: aStream [
	"If the behavior is removed we only need any renames and the final removal."

	entries allButLastDo: [ :replayEntry | 
		replayEntry isEpBehaviorNameChange ifTrue:
			[ aStream nextPut: replayEntry ] ].
	aStream nextPut: entries last.

]

{ #category : #initialization }
GtEpReplayBehaviorModel >> reset [ 

	super reset.
	classSide := GtEpReplayMetaBehaviorModel new instanceSide: self.
	comments := OrderedCollection new.
	previousNames := OrderedCollection new.
]
