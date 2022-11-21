"
GtEpEventSequencer takes a chronological sequence of events and filters and orders it ready for replay, allowing an image to be synced up to a later image.
"
Class {
	#name : #GtEpEventSequencer,
	#superclass : #Object,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#instVars : [
		'impactFilter'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #private }
GtEpEventSequencer >> behaviorEntriesFrom: chronologicalEntries includeCurrent: currentBoolean [
	"Group behaviour changes by name, and if currentBoolean is false, have an impact on the current system and either add or reject the entire group"
	| entriesDictionary currentEntry behaviorEntries |

	entriesDictionary := Dictionary new.
	1 to: chronologicalEntries size do: [ :index |
		currentEntry := chronologicalEntries at: index.
		(self isBehaviorDefinitionChange: currentEntry content) ifTrue:
			[ (entriesDictionary at: currentEntry content affectedMarker ifAbsentPut: [ OrderedCollection new ]) add: currentEntry ] ].
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

{ #category : #initialization }
GtEpEventSequencer >> initialize [

	super initialize.
	impactFilter := EpImpactCodeChangeFilter new environment: self class environment.
]

{ #category : #testing }
GtEpEventSequencer >> isBehaviorDefinitionChange: anEpEvent [
	"Answer a boolean indicating whether the supplied event is a behavior (class or trait) definition change, and so must be replayed first."

	^ anEpEvent isEpClassChange or: [ anEpEvent isEpTraitChange ].
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

{ #category : #sequencing }
GtEpEventSequencer >> sequence: anEpEntryCollection [

	^ self sequence: anEpEntryCollection withCurrent: false.
]

{ #category : #sequencing }
GtEpEventSequencer >> sequence: anEpEntryCollection withCurrent: currentBoolean [
	"Sequence the supplied collection of OmEntries for replay.
	If currentBoolean is true, include entries that don't change the running system, if false filter them out."
	| chronologicalEntries |

	anEpEntryCollection ifEmpty: [ ^ anEpEntryCollection ].
	chronologicalEntries := self chronologicalEntriesFrom: anEpEntryCollection.
	^ self filteredEntriesFrom: chronologicalEntries includeCurrent: currentBoolean.

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
