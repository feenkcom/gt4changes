"
Iterate over the supplied {{gtClass:EpEvent}}s and populate the receiver's {{gtClass:GtEpReplayImageModel}}. 
"
Class {
	#name : #GtEpReplayEventVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'allEntries',
		'currentEntry',
		'image'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpReplayEventVisitor >> allEntries [

	^ allEntries
]

{ #category : #accessing }
GtEpReplayEventVisitor >> allEntries: anObject [

	allEntries := anObject
]

{ #category : #accessing }
GtEpReplayEventVisitor >> currentEntry [

	^ currentEntry
]

{ #category : #accessing }
GtEpReplayEventVisitor >> image [

	^ image
]

{ #category : #initialization }
GtEpReplayEventVisitor >> initialize [

	super initialize.
	image := GtEpReplayImageModel new.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorAddition: aChange [

	image addBehaviorAddition: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorChange: aChange [

	image addBehaviorChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorCommentChange: aChange [

	image addBehaviorCommentChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorModification: aChange [

	image addBehaviorModification: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorNameChange: aChange [
	"A behaviour can't be renamed to an existing class"

	image addBehaviorRename: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitCategoryChange: aChange [

	image addCategoryChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassAddition: aChange [

	^ self visitBehaviorAddition: aChange
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassModification: aChange [

	^ self visitBehaviorModification: aChange
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassRemoval: aChange [

	image addBehaviorRemoval: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitEvent: aChange [

	^ self error: 'All event types should be handled explicitly'
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitMethodAddition: aChange [

	image addMethodAddition: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitMethodChange: aChange [

	image addMethodChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitMethodModification: aChange [

	image addMethodModification: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitMethodRemoval: aChange [

	image addMethodRemoval: currentEntry.
]

{ #category : #visiting }
GtEpReplayEventVisitor >> visitNode: anOmEntry [

	currentEntry := anOmEntry.
	anOmEntry content accept: self.
]

{ #category : #visiting }
GtEpReplayEventVisitor >> visitNodes: aCollectionOfOmEntry [
	"Visit each of the nodes in chronological order."

	allEntries := aCollectionOfOmEntry sorted: [ :a :b | a gtTime < b gtTime ].
	allEntries do: [ :omEntry | self visitNode: omEntry ].
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitProtocolAddition: aProtocolAddition [

	^ image addProtocolAddition: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitProtocolChange: aProtocolAddition [

	^ self error: 'Shouldn''t get here'.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitProtocolRemoval: aProtocolRemoved [

	image addProtocolRemoval: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitRedo: aRedoEvent [
	"The events in the redo should follow, do nothing now."
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitRefactoring: anEvent [ 
	"Refactorings are redundant, e.g. a method rename will be followed by the add renamed method and remove old method events.
	Do nothing."
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitSessionSnapshot: anEvent [
	"Nothing to do"
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitTraitAddition: aChange [

	^ self visitBehaviorAddition: aChange
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitTraitModification: aChange [

	^ self visitBehaviorModification: aChange
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitTraitRemoval: aChange [

	image addTraitRemoval: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitUndo: anUndoEvent [
	"The events in the undo should follow, do nothing now."
]
