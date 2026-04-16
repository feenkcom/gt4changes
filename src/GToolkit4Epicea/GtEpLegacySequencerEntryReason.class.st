"
Compatibility wrapper around a legacy symbolic reason.
"
Class {
	#name : #GtEpLegacySequencerEntryReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'kind',
		'entry'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpLegacySequencerEntryReason class >> kind: aSymbol [
	^ self new kind: aSymbol; yourself
]

{ #category : #'instance creation' }
GtEpLegacySequencerEntryReason class >> kind: aSymbol entry: aGtEpSequencerEntry [
	^ self new 
		kind: aSymbol; 
		entry: aGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> entry [
	^ entry
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> entry: anObject [
	entry := anObject
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> explanation [
	^ 'Legacy reason: ', self label
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> kind [
	^ kind
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> kind: aSymbol [
	kind := aSymbol
]

{ #category : #accessing }
GtEpLegacySequencerEntryReason >> label [
	^ kind asString
]
