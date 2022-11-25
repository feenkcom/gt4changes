"
GtEpEventSequencer takes a chronological sequence of events and filters and orders it ready for replay, allowing an image to be synced up to a later image.
"
Class {
	#name : #GtEpEventSequencer,
	#superclass : #Object,
	#instVars : [
		'impactFilter',
		'entries',
		'sequencedEntries',
		'includeCurrent'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #sequencing }
GtEpEventSequencer class >> entries: anEpEntryCollection includeCurrent: currentBoolean [

	^ self new
		entries: anEpEntryCollection;
		includeCurrent: currentBoolean
]

{ #category : #sequencing }
GtEpEventSequencer class >> sequence: anEpEntryCollection [

	^ self sequence: anEpEntryCollection withCurrent: false.
]

{ #category : #sequencing }
GtEpEventSequencer class >> sequence: anEpEntryCollection withCurrent: currentBoolean [
	"Sequence the supplied collection of OmEntries for replay and answer an OrderedCollection of entries.
	If currentBoolean is true, include entries that don't change the running system, if false filter them out."
	| sequencer chronologicalEntries |

	anEpEntryCollection ifEmpty: [ ^ anEpEntryCollection ].
	sequencer := self new.
	chronologicalEntries := sequencer chronologicalEntriesFrom: anEpEntryCollection.
	^ sequencer filteredEntriesFrom: chronologicalEntries includeCurrent: currentBoolean.

]

{ #category : #accessing }
GtEpEventSequencer >> apply [
	"Apply each of the events in the receiver"

	self sequencedEntries do: [ :each |
		each content applyCodeChange ].
]

{ #category : #private }
GtEpEventSequencer >> behaviorEntriesFrom: chronologicalEntries includeCurrent: currentBoolean [
	"Group behaviour changes by name, and if currentBoolean is false, have an impact on the current system and either add or reject the entire group"
	| entriesDictionary currentEntry behaviorEntries |

	entriesDictionary := Dictionary new.
	1 to: chronologicalEntries size do: [ :index |
		currentEntry := chronologicalEntries at: index.
		(self isBehaviorDefinitionChange: currentEntry content) ifTrue:
			[ (entriesDictionary at: currentEntry content behaviorAffectedName ifAbsentPut: [ OrderedCollection new ]) add: currentEntry ] ].
	behaviorEntries := OrderedCollection new.
	entriesDictionary do: [ :entry |
		(currentBoolean or: [ impactFilter accepts: entry last ]) ifTrue:
			[ behaviorEntries addAll: entry ] ].
	^ behaviorEntries
]

{ #category : #private }
GtEpEventSequencer >> chronologicalEntriesFrom: anEpEntryCollection [
	"Answer the supplied collection of events ensuring the oldest is first.
	NOTE: anEpEventCollection is assumed to be either chronological or reverse chronological."
	| firstTime lastTime |

	firstTime := anEpEntryCollection first gtTime.
	lastTime := anEpEntryCollection last gtTime.
	^ firstTime > lastTime 
		ifTrue: [ anEpEntryCollection reversed ]
		ifFalse: [ anEpEntryCollection copy ].

]

{ #category : #accessing }
GtEpEventSequencer >> entries [

	^ entries
]

{ #category : #accessing }
GtEpEventSequencer >> entries: anObject [

	entries := anObject
]

{ #category : #private }
GtEpEventSequencer >> filteredEntriesFrom: chronologicalEntries includeCurrent: currentBoolean [
	"Select only the events which:
	- are a code change
	- if not a class or trait definition (isEpBehaviorChange): aren't overridden by a later change.
	- if currentBoolean is false, aren't the same as the current image.
	As class/trait changes can depend on earlier changes - e.g. add class, add trait, add class to trait - class/trait changes are kept or removed as a block.
	This also has the side effect of sorting entries in to behaviour and other."

	^ ((self behaviorEntriesFrom: chronologicalEntries includeCurrent: currentBoolean),
		(self otherEntriesFrom: chronologicalEntries includeCurrent: currentBoolean))
			sorted: #gtTime ascending.
]

{ #category : #accessing }
GtEpEventSequencer >> getSequencedEntries [
	"(Re)calculate the sequenced entries from the entries"
	| chronologicalEntries |

	chronologicalEntries := self chronologicalEntriesFrom: entries.
	^ self filteredEntriesFrom: chronologicalEntries includeCurrent: includeCurrent.
]

{ #category : #accessing }
GtEpEventSequencer >> gtActionApplyFor: anAction [
	<gtAction>

	^ anAction button
		label: 'Apply';
		priority: 10;
		action: [ self apply ].
]

{ #category : #accessing }
GtEpEventSequencer >> gtEntriesFor: aView [
	<gtView>

	^ aView list
		title: 'Entries';
		priority: 10;
		itemText: [ :item | item content ];
		items: [ self sequencedEntries ].
]

{ #category : #accessing }
GtEpEventSequencer >> includeCurrent [
	"Answer a boolean indicating whether the latest entry should be included even if it doesn't change the current system"
	<return: #Boolean>

	^ includeCurrent
]

{ #category : #accessing }
GtEpEventSequencer >> includeCurrent: aBoolean [

	includeCurrent := aBoolean
]

{ #category : #initialization }
GtEpEventSequencer >> initialize [

	super initialize.
	impactFilter := EpImpactCodeChangeFilter new environment: self class environment.
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

{ #category : #private }
GtEpEventSequencer >> otherEntriesFrom: chronologicalEntries includeCurrent: currentBoolean [
	"Filter non-behaviour changes which are the latest code change, and if currentBoolean is false, have an impact on the current system"
	| entriesDictionary otherEntries |

	entriesDictionary := Dictionary new.
	1 to: chronologicalEntries size do: [ :index | | currentEntry |
		currentEntry := chronologicalEntries at: index.
		(currentEntry content isCodeChange and:
			[ (self isBehaviorDefinitionChange: currentEntry content) not ]) ifTrue:
				[ entriesDictionary at: currentEntry content affectedMarker put: currentEntry ] ].
	otherEntries := OrderedCollection new.
	entriesDictionary do: [ :entry |
		(currentBoolean or: [ impactFilter accepts: entry ]) ifTrue:
				[ otherEntries add: entry ] ].
	^ otherEntries
]

{ #category : #accessing }
GtEpEventSequencer >> sequencedEntries [

	entries ifEmpty: [ ^ sequencedEntries := entries ].
	^ sequencedEntries ifNil: [ sequencedEntries := self getSequencedEntries ].
]

{ #category : #private }
GtEpEventSequencer >> sortedEntriesFrom: filteredEntries [
	"Sort the supplied events so that class and trait definitions come before everything else (to avoid a method being applied to a class that doesn't yet exist"
	| behaviorDefinitions other |

	behaviorDefinitions := OrderedCollection new.
	other := OrderedCollection new.
	filteredEntries do: [ :entry |
		entry content isEpBehaviorChange
			ifTrue: [ behaviorDefinitions add: entry ]
			ifFalse: [ other add: entry ] ].
	^ behaviorDefinitions, other.
]
