"
Reason describing that an entry is superseded because the affected behavior was removed.
"
Class {
	#name : #GtEpBehaviorRemovedReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'behaviorName',
		'removalEntry',
		'supersededEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpBehaviorRemovedReason class >> behaviorName: aSymbol removalEntry: aGtEpSequencerEntry supersededEntry: anotherGtEpSequencerEntry [
	^ self new
		behaviorName: aSymbol;
		removalEntry: aGtEpSequencerEntry;
		supersededEntry: anotherGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> behaviorName [
	^ behaviorName
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> behaviorName: aSymbol [
	behaviorName := aSymbol
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> explanation [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Superseded because ';
			print: behaviorName;
			nextPutAll: ' is later removed' ]
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> kind [
	^ #behaviorRemoved
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> label [
	^ 'Behavior removed later'
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> relatedEntries [
	^ removalEntry
		ifNil: [ supersededEntry ifNil: [ #() ] ifNotNil: [ { supersededEntry } ] ]
		ifNotNil: [ supersededEntry ifNil: [ { removalEntry } ] ifNotNil: [ { removalEntry. supersededEntry } ] ]
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> removalEntry [
	^ removalEntry
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> removalEntry: aGtEpSequencerEntry [
	removalEntry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> supersededEntry [
	^ supersededEntry
]

{ #category : #accessing }
GtEpBehaviorRemovedReason >> supersededEntry: aGtEpSequencerEntry [
	supersededEntry := aGtEpSequencerEntry
]
