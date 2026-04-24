"
Reason describing that an entry belonging to the current behavior life is required in the exported sequence.
"
Class {
	#name : #GtEpBehaviorEntryRequiredReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'previousLifeBehaviorModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpBehaviorEntryRequiredReason class >> requiredEntry: aGtEpSequencerEntry previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		previousLifeBehaviorModel: aGtEpReplayBehaviorModel;
		yourself
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> explanation [
	^ 'Required because the entry belongs to an exported behavior and hasn''t been superseeded'
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> kind [
	^ #behaviorEntryRequired
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> label [
	^ 'Behavior entry required'
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> previousLifeBehaviorModel [
	^ previousLifeBehaviorModel
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> previousLifeBehaviorModel: aGtEpReplayBehaviorModel [
	previousLifeBehaviorModel := aGtEpReplayBehaviorModel
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpBehaviorEntryRequiredReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
