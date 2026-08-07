"
Reason describing that a required class definition is superseded by the next contiguous required class definition for the same behavior.
"
Class {
	#name : #GtEpContigousClassDefinitionReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'requiredEntry',
		'nextEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpContigousClassDefinitionReason class >> requiredEntry: aGtEpSequencerEntry nextEntry: anotherGtEpSequencerEntry [
	^ self new
		requiredEntry: aGtEpSequencerEntry;
		nextEntry: anotherGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> explanation [
	^ 'Superseded by the next contiguous required class definition for the same behavior'
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> kind [
	^ #contigousClassDefinition
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> label [
	^ 'Contigous class definition'
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> nextEntry [
	^ nextEntry
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> nextEntry: aGtEpSequencerEntry [
	nextEntry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> relatedEntries [
	^ nextEntry
		ifNil: [ requiredEntry ifNil: [ #() ] ifNotNil: [ { requiredEntry } ] ]
		ifNotNil: [ requiredEntry ifNil: [ { nextEntry } ] ifNotNil: [ { requiredEntry. nextEntry } ] ]
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> requiredEntry [
	^ requiredEntry
]

{ #category : #accessing }
GtEpContigousClassDefinitionReason >> requiredEntry: aGtEpSequencerEntry [
	requiredEntry := aGtEpSequencerEntry
]
