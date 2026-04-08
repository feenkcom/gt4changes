Class {
	#name : #GtEpEventSequencerError,
	#superclass : #GtEpError,
	#instVars : [
		'model'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpEventSequencerError class >> signalModel: aGtEpReplayModel [

	^ self new
		model: aGtEpReplayModel;
		signal.
]

{ #category : #accessing }
GtEpEventSequencerError >> model [
	^ model
]

{ #category : #accessing }
GtEpEventSequencerError >> model: anObject [
	model := anObject
]
