"
Reason describing that a method removal has no effect because the target method does not exist.
"
Class {
	#name : #GtEpMethodDoesntExistReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'entry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpMethodDoesntExistReason class >> entry: aGtEpSequencerEntry [
	^ self new
		entry: aGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> entry [
	^ entry
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> entry: aGtEpSequencerEntry [
	entry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> explanation [
	^ 'Superseded because the target method does not exist in the current image'
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> kind [
	^ #methodDoesntExist
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> label [
	^ 'Method doesnt exist'
]

{ #category : #accessing }
GtEpMethodDoesntExistReason >> relatedEntries [
	^ entry ifNil: [ #() ] ifNotNil: [ { entry } ]
]
