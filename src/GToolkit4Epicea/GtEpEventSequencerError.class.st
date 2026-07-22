Class {
	#name : #GtEpEventSequencerError,
	#superclass : #GtEpError,
	#instVars : [
		'entry'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpEventSequencerError class >> signalEntry: aGtEpSequencerEntry [

	^ self new
		entry: aGtEpSequencerEntry;
		signal.
]

{ #category : #accessing }
GtEpEventSequencerError >> entry [
	^ entry
]

{ #category : #accessing }
GtEpEventSequencerError >> entry: anObject [
	entry := anObject
]
