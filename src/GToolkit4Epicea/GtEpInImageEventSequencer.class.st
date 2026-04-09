Class {
	#name : #GtEpInImageEventSequencer,
	#superclass : #GtEpEventSequencer,
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'private - accessing' }
GtEpInImageEventSequencer >> getReplayVisitor [

	^ GtEpImageModelReplayVisitor new wrappedEntries: wrappedEntries.
]

{ #category : #'private - accessing' }
GtEpInImageEventSequencer >> getSequencedEntries [
	"Calculate the sequenced entries from the entries.
	The sequence generation consists of three steps:
	1. Iterate over the events building the image model (see {{gtMethod:GtEpEventSequencer>>image}}).
	2. Iterate over the image model and select required events.
	3. Sort the events chronologically."

	wrappedEntries ifEmpty: [ ^ wrappedEntries ].
	replayVisitor := GtEpImageModelReplayVisitor new wrappedEntries: wrappedEntries.
	^ replayVisitor sequencedEntries.
]
