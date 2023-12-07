"
GtEpEventSequencer takes a chronological sequence of events from a single branch and filters and orders it ready for replay, allowing an image to be synced up to a later image.
"
Class {
	#name : #GtEpEventSequencer,
	#superclass : #Object,
	#instVars : [
		'entries',
		'sequencedEntries',
		'visitor',
		'image',
		'replay',
		'inImage'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #sequencing }
GtEpEventSequencer class >> entries: anEpEntryCollection includeCurrent: currentBoolean [

	self deprecated: 'Use #entries:inImage:'.
	^ self entries: anEpEntryCollection inImage: currentBoolean not
]

{ #category : #sequencing }
GtEpEventSequencer class >> entries: anEpEntryCollection inImage: inImageBoolean [
	"Create an instance of the sequencer, chosen based on inImageBoolean.
	This is for backward compatibility - the appropriate event sequencer should be used directly."

	^ (inImageBoolean ifTrue:
		[ GtEpInImageEventSequencer ]
	ifFalse:
		[ GtEpForExportEventSequencer ]) new
			entries: anEpEntryCollection
]

{ #category : #accessing }
GtEpEventSequencer class >> forCurrentSession [
	"Answer the receiver with the current session sequenced, including changes which are already in the image."

	^ self
		entries: (GtEpLogEnumerator new latestLog: EpMonitor current log) priorEntriesFromHead
		inImage: false.
]

{ #category : #sequencing }
GtEpEventSequencer class >> sequence: anEpEntryCollection [

	^ self entries: anEpEntryCollection inImage: true.
]

{ #category : #sequencing }
GtEpEventSequencer class >> sequence: anEpEntryCollection withCurrent: currentBoolean [
	"Sequence the supplied collection of OmEntries for replay and answer an OrderedCollection of entries.
	If currentBoolean is true, include entries that don't change the running system, if false filter them out."

	self deprecated: 'Use #entries:inImage:'.
	^ self entries: anEpEntryCollection inImage: currentBoolean not.
]

{ #category : #accessing }
GtEpEventSequencer >> apply [
	"Apply each of the events in the receiver if it has an impact."

	self sequencedEntries do: [ :each |
		each content applyCodeChangeIfHasImpact ].
]

{ #category : #accessing }
GtEpEventSequencer >> entries [

	^ entries
]

{ #category : #accessing }
GtEpEventSequencer >> entries: anObject [

	entries := anObject.
	sequencedEntries := nil.
]

{ #category : #'private - accessing' }
GtEpEventSequencer >> getSequencedEntries [
	"Calculate the sequenced entries from the entries.
	The sequence generation consists of three steps:
	1. Iterate over the events building the image model (see {{gtMethod:GtEpEventSequencer>>image}}).
	2. Iterate over the image model and select required events.
	3. Sort the events chronologically."

	^ self subclassResponsibility
]

{ #category : #'gt - extensions' }
GtEpEventSequencer >> gtBackgroundColorForEntry: anOmbuEntry [ 
	^ (((sequencedEntries ifNil: [#()])
			includes: anOmbuEntry) 
				ifTrue: [ Color black ] 
				ifFalse: [ Color gray])
]

{ #category : #accessing }
GtEpEventSequencer >> gtChangeListFor: aView [
	<gtView>

	^ aView forward
		title: 'Change list';
		priority: 5;
		object: [ GtEpiceaSequencedLog sequencer: self ];
		view: #gtEventsFor:
]

{ #category : #'gt - extensions' }
GtEpEventSequencer >> gtViewAllEntriesFor: aView [
	<gtView>

	^ aView columnedList
		title: 'All entries';
		priority: 20;
		items: [ entries ];
		column: 'Change' text: [ :anOmbuEntry | 
			anOmbuEntry content asRopedText 
				foreground: (self gtBackgroundColorForEntry: anOmbuEntry) ];
		column: 'Timestamp' 
			text: [ :anOmbuEntry | 
				anOmbuEntry gtTime asString asRopedText 
					foreground: (self gtBackgroundColorForEntry: anOmbuEntry) ] 
			width: 250
]

{ #category : #'gt - extensions' }
GtEpEventSequencer >> gtViewSequencedEntriesFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Sequenced entries';
		priority: 10;
		items: [ self sequencedEntries ];
		column: 'Change' text: [ :anOmbuEntry | anOmbuEntry content ];
		column: 'Timestamp' text: [ :anOmbuEntry | anOmbuEntry gtTime ] width: 250
]

{ #category : #accessing }
GtEpEventSequencer >> image [
	"Answer the image model."
	<return: #GtEpReplayImageModel>

	^ image ifNil:
		[ visitor := GtEpReplayEventVisitor new.
		visitor visitNodes: entries.
		image := visitor image ].
]

{ #category : #testing }
GtEpEventSequencer >> isBehaviorDefinitionChange: anEpEvent [
	"Answer a boolean indicating whether the supplied event is a behavior change that must be replayed first."

	^ anEpEvent isEpBehaviorChange and:
		[ anEpEvent isEpProtocolChange not and:
		[ anEpEvent isEpBehaviorCommentChange not ] ].
]

{ #category : #private }
GtEpEventSequencer >> isEvent: currentEntry notOverriddenIn: chronologicalEntries startingFrom: startIndex [
	"Answer a boolean indicating whether the supplied event is not overridden later in the collection"
	| entry |

	startIndex to: chronologicalEntries size do: [ :index |
		entry := chronologicalEntries at: index.
		(entry content isCodeChange and: [ entry content doesOverride: currentEntry content ]) ifTrue:
			[ ^ false ] ].
	^ true
]

{ #category : #accessing }
GtEpEventSequencer >> sequencedEntries [

	^ sequencedEntries ifNil: [ sequencedEntries := self getSequencedEntries ].
]

{ #category : #accessing }
GtEpEventSequencer >> visitor [

	^ visitor
]
