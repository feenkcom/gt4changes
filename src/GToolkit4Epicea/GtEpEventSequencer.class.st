"
GtEpEventSequencer takes a chronological sequence of events from a single branch and filters and orders it ready for replay, allowing an image to be synced up to a later image.
"
Class {
	#name : #GtEpEventSequencer,
	#superclass : #Object,
	#instVars : [
		'sequencedEntries',
		'visitor',
		'image',
		'wrappedEntries',
		'replayVisitor'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #sequencing }
GtEpEventSequencer class >> entries: anEpEntryCollection [

	^ self new entries: anEpEntryCollection
]

{ #category : #sequencing }
GtEpEventSequencer class >> entries: anEpEntryCollection inImage: inImageBoolean [
	"Create an instance of the sequencer, chosen based on inImageBoolean.
	This is for backward compatibility - the appropriate event sequencer should be used directly."

	self deprecated: 'Use the appropriate subclass'.

	^ (inImageBoolean ifTrue:
		[ GtEpInImageEventSequencer ]
	ifFalse:
		[ GtEpForExportEventSequencer ]) new
			entries: anEpEntryCollection
]

{ #category : #accessing }
GtEpEventSequencer class >> forCurrentSession [
	"Answer the receiver with the current session sequenced, including changes which are already in the image."

	^ GtEpForExportEventSequencer entries: 
			(GtEpLogEnumerator new latestLog: EpMonitor current log) priorEntriesFromHead reversed
]

{ #category : #sequencing }
GtEpEventSequencer class >> sequence: anEpEntryCollection [

	^ (self entries: anEpEntryCollection) sequencedEntries
]

{ #category : #accessing }
GtEpEventSequencer >> apply [
	"Apply each of the events in the receiver if it has an impact."

	self sequencedEntries do: [ :each |
		each content applyCodeChangeIfHasImpact ].
]

{ #category : #asserting }
GtEpEventSequencer >> assertDependencies [

	self replayVisitor assertDependencies
]

{ #category : #accessing }
GtEpEventSequencer >> entries [

	^ wrappedEntries collect: [ :gtEpSequencerEntry | gtEpSequencerEntry omEntry ]
]

{ #category : #accessing }
GtEpEventSequencer >> entries: aCollection [

	wrappedEntries := aCollection collectWithIndex: [ :omEntry :index |
		GtEpSequencerEntry new
			omEntry: omEntry;
			sortOrder: index ].
	sequencedEntries := nil.
]

{ #category : #'private - accessing' }
GtEpEventSequencer >> getReplayVisitor [

	^ self subclassResponsibility
]

{ #category : #'private - accessing' }
GtEpEventSequencer >> getSequencedEntries [

	wrappedEntries ifEmpty: [ ^ wrappedEntries ].
	replayVisitor := self getReplayVisitor.
	^ replayVisitor sequencedEntries.
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
		items: [ wrappedEntries ];
		column: 'Change' text: [ :anEntry | 
			anEntry asRopedText 
				foreground: (self gtBackgroundColorForEntry: anEntry) ];
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

	^ self replayVisitor image
]

{ #category : #accessing }
GtEpEventSequencer >> replayVisitor [
	^ replayVisitor
]

{ #category : #accessing }
GtEpEventSequencer >> sequencedEntries [

	^ sequencedEntries ifNil: [ sequencedEntries := self getSequencedEntries ].
]

{ #category : #accessing }
GtEpEventSequencer >> visitor [

	^ visitor
]

{ #category : #accessing }
GtEpEventSequencer >> wrappedEntries [
	^ wrappedEntries
]

{ #category : #accessing }
GtEpEventSequencer >> wrappedEntries: anObject [
	wrappedEntries := anObject
]
