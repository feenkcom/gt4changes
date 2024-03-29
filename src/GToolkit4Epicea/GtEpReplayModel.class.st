"
Model the state of an image given a sequence of {{gtClass:EpEvent}}s, allowing the current state and minimal changes required to synchronise the running system and desired state.
"
Class {
	#name : #GtEpReplayModel,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayModel >> accept: aVisitor [

	self subclassResponsibility 
]

{ #category : #enumerating }
GtEpReplayModel >> allEntries [

	^ GtEpImageModelAllEntriesVisitor new visitNode: self.
]

{ #category : #accessing }
GtEpReplayModel >> asRingDefinition [
	"Answer the Ring definition of the receiver"

	^ self subclassResponsibility.
]

{ #category : #accessing }
GtEpReplayModel >> currentDefinition [
	"Answer the receiver's object in the running system"
	
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpReplayModel >> entries [

	^ entries
]

{ #category : #accessing }
GtEpReplayModel >> environment [

	^ self class environment
]

{ #category : #ui }
GtEpReplayModel >> gtEntriesFor: aView [
	<gtView>

	^ aView forward
		title: 'Entries';
		priority: 20;
		object: [ GtEpiceaEntriesGroup withAll: entries ];
		view: #gtItemsFor:;
		actionUpdateButton
]

{ #category : #testing }
GtEpReplayModel >> hasChanges [

	^ entries isNotEmpty
]

{ #category : #testing }
GtEpReplayModel >> hasEntries [

	^ entries isNotEmpty
]

{ #category : #initialization }
GtEpReplayModel >> initialize [

	super initialize.
	entries := OrderedCollection new.
]

{ #category : #accessing }
GtEpReplayModel >> latestEntry [

	^ entries last
]
