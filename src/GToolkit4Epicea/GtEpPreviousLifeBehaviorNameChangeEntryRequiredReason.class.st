"
Reason describing that a behavior name change entry from a previous life must be kept in the exported sequence.
"
Class {
	#name : #GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'previousLifeBehaviorModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason class >> requiredEntry: aGtEpSequencerEntry previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		previousLifeBehaviorModel: aGtEpReplayBehaviorModel;
		yourself
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> explanation [
	^ 'Required because a behavior name change entry from a previous life must be kept'
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> kind [
	^ #previousLifeBehaviorNameChangeEntryRequired
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> label [
	^ 'Previous life behavior name change entry required'
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> previousLifeBehaviorModel [
	^ previousLifeBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	previousLifeBehaviorModel := aGtEpReplayBehaviorModel
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
