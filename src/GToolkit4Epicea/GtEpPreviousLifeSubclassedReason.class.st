"
Reason describing that an entry is required because a previous life of the behavior had subclasses, requiring all modifications to be kept.
"
Class {
	#name : #GtEpPreviousLifeSubclassedReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'previousLifeBehaviorModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpPreviousLifeSubclassedReason class >> requiredEntry: aGtEpSequencerEntry previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		previousLifeBehaviorModel: aGtEpReplayBehaviorModel;
		yourself
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> explanation [
	^ 'Required because a previous life of the behavior had subclasses'
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> kind [
	^ #previousLifeSubclassed
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> label [
	^ 'Previous life subclassed'
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> previousLifeBehaviorModel [
	^ previousLifeBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	previousLifeBehaviorModel := aGtEpReplayBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpPreviousLifeSubclassedReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
