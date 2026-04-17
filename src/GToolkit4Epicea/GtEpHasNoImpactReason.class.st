"
Reason describing that a required behavior definition has no impact when replayed in the current image.
"
Class {
	#name : #GtEpHasNoImpactReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'model'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpHasNoImpactReason class >> requiredEntry: aGtEpSequencerEntry model: anObject [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		model: anObject;
		yourself
]

{ #category : #accessing }
GtEpHasNoImpactReason >> explanation [
	^ 'Superseded because replaying the entry would have no impact on the current image'
]

{ #category : #accessing }
GtEpHasNoImpactReason >> kind [
	^ #hasNoImpact
]

{ #category : #accessing }
GtEpHasNoImpactReason >> label [
	^ 'Has no impact'
]

{ #category : #accessing }
GtEpHasNoImpactReason >> model [
	^ model
]

{ #category : #accessing }
GtEpHasNoImpactReason >> model: anObject [
	model := anObject
]

{ #category : #accessing }
GtEpHasNoImpactReason >> relatedEntries [
	^ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ]
]

{ #category : #accessing }
GtEpHasNoImpactReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpHasNoImpactReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
