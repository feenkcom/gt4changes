"
Reason describing that the latest comment entry for a behavior must be kept in the exported sequence.
"
Class {
	#name : #GtEpLastCommentEntryRequiredReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'behaviorModel'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpLastCommentEntryRequiredReason class >> requiredEntry: aGtEpSequencerEntry behaviorModel: aGtEpReplayBehaviorModel [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		behaviorModel: aGtEpReplayBehaviorModel;
		yourself
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> behaviorModel [
	^ behaviorModel
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> behaviorModel: aGtEpReplayBehaviorModel [
	behaviorModel := aGtEpReplayBehaviorModel
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> explanation [
	^ 'Required because only the latest comment entry for the behavior is replayed'
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> kind [
	^ #lastCommentEntryRequired
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> label [
	^ 'Last comment entry required'
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpLastCommentEntryRequiredReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
