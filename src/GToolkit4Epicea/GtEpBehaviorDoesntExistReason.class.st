Class {
	#name : #GtEpBehaviorDoesntExistReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'behaviorName',
		'removalEntry',
		'supersededEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpBehaviorDoesntExistReason class >> behaviorName: aSymbol supersededEntry: anotherGtEpSequencerEntry [

	^ self new
		behaviorName: aSymbol;
		supersededEntry: anotherGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> behaviorName [
	^ behaviorName
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> behaviorName: aSymbol [
	behaviorName := aSymbol
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> explanation [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Superseded because ';
			print: behaviorName;
			nextPutAll: ' doesn''t exist in the running image' ]
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> kind [
	^ #classDoesntExist
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> label [
	^ 'Behavior doesn''t exist'
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> relatedEntries [
	^ supersededEntry ifNil: [ #() ] ifNotNil: [ { supersededEntry } ]
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> supersededEntry [
	^ supersededEntry
]

{ #category : #accessing }
GtEpBehaviorDoesntExistReason >> supersededEntry: aGtEpSequencerEntry [
	supersededEntry := aGtEpSequencerEntry
]
