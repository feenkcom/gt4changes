"
Reason describing that the last entry of a previous life must be kept to preserve that previous life in the exported sequence.
"
Class {
	#name : #GtEpPreviousLifeLastBehaviorEntryRequiredReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'previousLifeBehaviorModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpPreviousLifeLastBehaviorEntryRequiredReason class >> requiredEntry: aGtEpSequencerEntry previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		previousLifeBehaviorModel: aGtEpReplayBehaviorModel;
		yourself
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> explanation [
	^ 'Required because the last entry of a previous life must be kept'
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> kind [
	^ #previousLifeLastBehaviorEntryRequired
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> label [
	^ 'Previous life last behavior entry required'
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> previousLifeBehaviorModel [
	^ previousLifeBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	previousLifeBehaviorModel := aGtEpReplayBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpPreviousLifeLastBehaviorEntryRequiredReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
