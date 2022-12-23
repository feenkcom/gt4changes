"
GtEpLogEnumerator follows chains of events over multiple epicea log files.
"
Class {
	#name : #GtEpLogEnumerator,
	#superclass : #Object,
	#traits : 'TGtEpiceaLogView',
	#classTraits : 'TGtEpiceaLogView classTrait',
	#instVars : [
		'latestLog'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpLogEnumerator class >> fromFile: aFileReference [

	^ self new latestLog: (EpLog fromFile: aFileReference)
]

{ #category : #enumerating }
GtEpLogEnumerator >> entriesFrom: startOmReference to: endOmReference [
	"Answer the sequence of entries from startOmReference to endOmReference.
	endOmReference must be in the receiver's log."

	^ Array streamContents: [  :stream |
		self 
			priorEntriesFrom: endOmReference 
			backTo: startOmReference
			do: [ :anEntry | stream nextPut: anEntry ] ]
]

{ #category : #enumerating }
GtEpLogEnumerator >> eventsFrom: startOmReference to: endOmReference [
	"Answer the sequence of events from startOmReference to endOmReference.
	endOmReference must be in the receiver's log."

	^ Array streamContents: [  :stream |
		self 
			priorEntriesFrom: endOmReference 
			backTo: startOmReference
			do: [ :anEntry | stream nextPut: anEntry content ] ]
]

{ #category : #accessing }
GtEpLogEnumerator >> headReference [

	^ latestLog headReference
]

{ #category : #accessing }
GtEpLogEnumerator >> latestEntriesCount [

	^ latestLog entriesCount
]

{ #category : #accessing }
GtEpLogEnumerator >> latestLog [

	^ latestLog
]

{ #category : #accessing }
GtEpLogEnumerator >> latestLog: anObject [

	latestLog := anObject
]

{ #category : #private }
GtEpLogEnumerator >> logDirectory [
	"Answer the directory where the log files are stored.
	All files are assumed to be in the same directory as the receiver's latest log."

	^ latestLog store directory
]

{ #category : #private }
GtEpLogEnumerator >> previousLogFrom: anOmReference [
	"Answer an EpLog based on the supplied reference"
	| fileReference |

	fileReference := self logDirectory / (anOmReference globalName, OmFileStore defaultFileSuffix).
	fileReference exists ifFalse: [ ^ nil ].
	^ EpLog fromFile: fileReference.
]

{ #category : #enumerating }
GtEpLogEnumerator >> priorEntriesFrom: aReference [
	"Answer the chain of events leading up to the supplied reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."

	^ Array streamContents: [  :stream |
		self 
			priorEntriesFrom: aReference 
			backTo: OmNullReference uniqueInstance
			do: [ :anEntry | stream nextPut: anEntry ] ]
]

{ #category : #enumerating }
GtEpLogEnumerator >> priorEntriesFrom: endOmReference backTo: startOmReference do: aBlock [
	"Evaluate aBlock for each event in the chain of events leading up to the supplied reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."
	| currentLog currentReference previousReference |

	self assert: endOmReference globalName = latestLog headReference globalName.
	currentLog := latestLog.
	currentReference := endOmReference.
	[ currentReference isNull or: [ currentReference = startOmReference ] ] whileFalse:
		[ previousReference := currentReference.
		currentReference := self 
			priorEntriesIn: currentLog 
			from: currentReference 
			backTo: startOmReference 
			do: aBlock.
		currentReference isNull ifFalse:
			[ currentLog := self previousLogFrom: currentReference.
			currentLog ifNil: [ currentReference := OmNullReference uniqueInstance ] ] ].
]

{ #category : #enumerating }
GtEpLogEnumerator >> priorEntriesFromHead [
	"Answer the chain of events leading up to the head reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."

	^ self priorEntriesFrom: self headReference.
]

{ #category : #enumerating }
GtEpLogEnumerator >> priorEntriesIn: anEpLog from: endReference backTo: startReference do: aBlock [
	"Evaluate aBlock for each event in the chain of events leading up to aReference in anEpLog, in reverse chronological order.
	Events that are not part of the headReference are excluded."
	| nextReference |

	nextReference := endReference.
	[ nextReference isNull or: [ nextReference = startReference ] ] whileFalse: [
		anEpLog 
			entryFor: nextReference 
			ifPresent: [ :entry | 
				aBlock value: entry.		
				nextReference := anEpLog priorReferenceAt: entry ]
			ifAbsent: [ ^ nextReference ] ].
	^ nextReference
]

{ #category : #accessing }
GtEpLogEnumerator >> treeView [

	^ self treeViewOn: self priorEntriesFromHead.
]
