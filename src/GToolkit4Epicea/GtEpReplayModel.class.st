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
GtEpReplayModel >> entries [

	^ entries
]

{ #category : #ui }
GtEpReplayModel >> gtEntriesFor: aView [
	<gtView>

	^ aView list
		title: 'Entries';
		priority: 20;
		items: [ entries ];
		actionUpdateButton
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

{ #category : #accessing }
GtEpReplayModel >> sequencedEntries [

	^ self replayEntries sorted: [ :a :b | a gtTime < b gtTime ]
]
