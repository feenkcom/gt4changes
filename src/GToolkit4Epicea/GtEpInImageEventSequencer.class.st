Class {
	#name : #GtEpInImageEventSequencer,
	#superclass : #GtEpEventSequencer,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'private - accessing' }
GtEpInImageEventSequencer >> getReplayVisitor [

	^ GtEpImageModelReplayVisitor new wrappedEntries: wrappedEntries.
]
