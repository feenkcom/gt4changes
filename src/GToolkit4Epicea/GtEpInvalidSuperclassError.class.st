"
GtEpInvalidSuperclassError signals that an attempt has been made to export a class that doesn't have  a valid superclass, e.g. it's obsolete.
"
Class {
	#name : #GtEpInvalidSuperclassError,
	#superclass : #GtEpEventSequencerError,
	#instVars : [
		'classModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #signalling }
GtEpInvalidSuperclassError class >> signalClassModel: aGtEpReplayBehaviorModel [

	^ self new
		classModel: aGtEpReplayBehaviorModel;
		signal.
]

{ #category : #accessing }
GtEpInvalidSuperclassError >> classModel [
	^ classModel
]

{ #category : #accessing }
GtEpInvalidSuperclassError >> classModel: anObject [
	classModel := anObject
]
