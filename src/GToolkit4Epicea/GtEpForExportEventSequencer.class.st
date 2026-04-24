Class {
	#name : #GtEpForExportEventSequencer,
	#superclass : #GtEpEventSequencer,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'private - accessing' }
GtEpForExportEventSequencer >> getReplayVisitor [

	^ GtEpImageModelExportVisitor new wrappedEntries: wrappedEntries.
]
