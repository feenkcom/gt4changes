"
GtEpEventSequencer takes a chronological sequence of events and filters it and orders it ready for replay, allowing an image to be synced up to a later image.
"
Class {
	#name : #GtEpEventSequencer,
	#superclass : #Object,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#instVars : [
		'impactFilter'
	],
	#category : #'GToolkit4Epicea-ImageSync'
}

{ #category : #private }
GtEpEventSequencer >> chronologicalEntriesFrom: anEpEntryCollection [
	"Answer the supplied collection of events ensuring the oldest is first.
	NOTE: anEpEventCollection is assumed to be either chronological or reverse chronological."
	| firstTime lastTime |

	firstTime := anEpEntryCollection first tagAt: #time.
	lastTime := anEpEntryCollection last tagAt: #time.
	^ firstTime > lastTime 
		ifTrue: [ anEpEntryCollection reversed ]
		ifFalse: [ anEpEntryCollection copy ].

]

{ #category : #private }
GtEpEventSequencer >> filteredEntriesFrom: chronologicalEntries [
	"Select only the events which:
	- are a code change
	- if not a class or trait definition (isEpBehaviorChange): aren't overridden by a later change.
	- aren't the same as the current image
	Based on the code in EpLatestCodeChangeFilter>>accepts: (which is unfortunately tied to the Morphic UI"
	| currentEntry filteredEntries |

	filteredEntries := OrderedCollection new.
	1 to: chronologicalEntries size - 1 do: [ :index |
		currentEntry := chronologicalEntries at: index.
		(currentEntry content isCodeChange and:
			[ (currentEntry content isEpBehaviorChange or:
				[ self isEvent: currentEntry notOverriddenIn: chronologicalEntries startingFrom: index + 1 ]) and:
			[ impactFilter accepts: currentEntry ] ]) ifTrue:
				[ filteredEntries add: currentEntry ] ].
	filteredEntries add: chronologicalEntries last.
	^ filteredEntries
]

{ #category : #initialization }
GtEpEventSequencer >> initialize [

	super initialize.
	impactFilter := EpImpactCodeChangeFilter new environment: self class environment.
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

{ #category : #sequencing }
GtEpEventSequencer >> sequence: anEpEntryCollection [
	| sortedEntries chronologicalEntries filteredEntries |

	chronologicalEntries := self chronologicalEntriesFrom: anEpEntryCollection.
	filteredEntries := self filteredEntriesFrom: chronologicalEntries.
	sortedEntries := self sortedEntriesFrom: filteredEntries.
	^ sortedEntries
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
