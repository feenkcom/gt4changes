"
Iterate over the supplied gtClass:GtEpReplayImageModel and answer the minimum collection of entries required to recover the code state for an external image.

In practice this means that the state of the running image is unknown, and additional events must be supplied.
"
Class {
	#name : #GtEpImageModelForExportVisitor,
	#superclass : #GtEpImageModelInImageVisitor,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #testing }
GtEpImageModelForExportVisitor >> behaviorEntriesChangeRunningSystem: replayEntries [
	"Answer a boolean indicating whether the supplied behavior changes impact the running system.
	Since we don't know the state of the other system we have to assume that it does change."

	^ true
]

{ #category : #testing }
GtEpImageModelForExportVisitor >> behaviorModificationEntryDiffersFromCurrent: anOmEntry [
	"Answer a boolean indicating whether the supplied behavior changes impact the running system.
	Since we don't know the state of the other system we have to assume that it does change."

	^ true
]

{ #category : #accessing }
GtEpImageModelForExportVisitor >> behaviorNameExists: aSymbol [

	^ true
]

{ #category : #testing }
GtEpImageModelForExportVisitor >> commentEntryChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating if the supplied entry will change the running system.
	Since we don't know the state of the remote system, answer true."
	| newComment |

	newComment := anOmEntry content newComment ifNil: [ '' ].
	"Don't allow the string 'nil' to be set as the comment"
	newComment = 'nil' ifTrue: [ ^ false ].

	^ true
]

{ #category : #accessing }
GtEpImageModelForExportVisitor >> eventHasImpact: anEpEvent [

	^ true
]

{ #category : #testing }
GtEpImageModelForExportVisitor >> methodEntryChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system.
	Since we don't know the state of the external system answer true."

	^ true
]

{ #category : #testing }
GtEpImageModelForExportVisitor >> protocolAdditionChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system"

	^ true
]

{ #category : #testing }
GtEpImageModelForExportVisitor >> protocolRemovalChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system"

	^ true
]
