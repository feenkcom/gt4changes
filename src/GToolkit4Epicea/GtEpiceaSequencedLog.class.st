Class {
	#name : #GtEpiceaSequencedLog,
	#superclass : #GtEpiceaAbstractLog,
	#instVars : [
		'sequencer'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpiceaSequencedLog class >> sequencer: aGtEpEventSequencer [

	^ self new sequencer: aGtEpEventSequencer
]

{ #category : #accessing }
GtEpiceaSequencedLog >> entries [

	^ sequencer sequencedEntries
]

{ #category : #accessing }
GtEpiceaSequencedLog >> entriesStream [

	^ self entries asAsyncStream
]

{ #category : #accessing }
GtEpiceaSequencedLog >> isActive [
	^ false
]

{ #category : #accessing }
GtEpiceaSequencedLog >> logs [
	^ {}
]

{ #category : #accessing }
GtEpiceaSequencedLog >> name [

	^ 'Sequenced Entries'
]

{ #category : #accessing }
GtEpiceaSequencedLog >> sequencer [

	^ sequencer
]

{ #category : #accessing }
GtEpiceaSequencedLog >> sequencer: aGtEpEventSequencer [

	sequencer := aGtEpEventSequencer
]

{ #category : #accessing }
GtEpiceaSequencedLog >> timeAt: anEntry [
	^ anEntry tags at: #time
]
