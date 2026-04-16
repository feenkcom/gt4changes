"
Reason describing that a method change is superseded because its affected class or trait does not exist.
"
Class {
	#name : #GtEpMethodsClassDoesntExistReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'entry'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpMethodsClassDoesntExistReason class >> entry: aGtEpSequencerEntry [
	^ self new
		entry: aGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> entry [
	^ entry
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> entry: aGtEpSequencerEntry [
	entry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> explanation [
	^ 'Superseded because the affected class or trait of the method change does not exist'
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> kind [
	^ #methodsClassDoesntExist
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> label [
	^ 'Method''s class doesnt exist'
]

{ #category : #accessing }
GtEpMethodsClassDoesntExistReason >> relatedEntries [
	^ entry ifNil: [ #() ] ifNotNil: [ { entry } ]
]
