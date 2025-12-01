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
	#category : 'GToolkit4Epicea-Sequencer'
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

	self error: 'Behaviors should be added explicitly (Class or Trait)'.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorCategoryChange: aChange [

	image addBehaviorCategoryChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorChange: aChange [

	self error: 'Behaviors should be modified explicitly (Class or Trait)'.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorCommentChange: aChange [

	image addBehaviorCommentChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorModification: aChange [

	self error: 'Behaviors should be modified explicitly (Class or Trait)'.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorNameChange: aChange [
	"A behaviour can't be renamed to an existing class"

	image addBehaviorRename: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitBehaviorRepackagedChange: aBehaviorRepackagedChange [

	image addBehaviorRepackagedChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitCategoryChange: aChange [

	image addCategoryChange: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassAddition: aChange [

	image addClassAddition: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassModification: aChange [

	image addClassModification: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitClassRemoval: aChange [

	image addClassRemoval: currentEntry.
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitEvent: aChange [

	^ image addOtherChange: currentEntry.
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

{ #category : #visitor }
GtEpReplayEventVisitor >> visitMethodUpdateNoSource: aChange [

	image addMethodAddition: currentEntry
]

{ #category : #visiting }
GtEpReplayEventVisitor >> visitNode: anOmEntry [

	currentEntry := anOmEntry.
	anOmEntry content accept: self.
]

{ #category : #visiting }
GtEpReplayEventVisitor >> visitNodes: aCollectionOfOmEntry [
	"Visit each of the nodes in chronological order."

	allEntries := aCollectionOfOmEntry sorted: GtOmEntrySortFunction new.
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
GtEpReplayEventVisitor >> visitTraitAddition: aChange [

	image addTraitAddition: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitTraitModification: aChange [

	image addTraitModification: currentEntry
]

{ #category : #visitor }
GtEpReplayEventVisitor >> visitTraitRemoval: aChange [

	image addTraitRemoval: currentEntry.
]
