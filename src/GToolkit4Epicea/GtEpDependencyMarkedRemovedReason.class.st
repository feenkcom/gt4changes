"
Reason describing that a required entry has a dependency that was removed in the sequence.
"
Class {
	#name : #GtEpDependencyMarkedRemovedReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'dependencyName',
		'dependencyEntry',
		'dependentEntry'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpDependencyMarkedRemovedReason class >> dependencyName: aSymbol dependencyEntry: aGtEpSequencerEntry dependentEntry: anotherGtEpSequencerEntry [
	^ self new
		dependencyName: aSymbol;
		dependencyEntry: aGtEpSequencerEntry;
		dependentEntry: anotherGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependencyEntry [
	^ dependencyEntry
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependencyEntry: aGtEpSequencerEntry [
	dependencyEntry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependencyName [
	^ dependencyName
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependencyName: aSymbol [
	dependencyName := aSymbol
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependentEntry [
	^ dependentEntry
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> dependentEntry: aGtEpSequencerEntry [
	dependentEntry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> explanation [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Required entry depends on ';
			print: dependencyName;
			nextPutAll: ' but that dependency is marked removed' ]
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> kind [
	^ #dependencyMarkedRemoved
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> label [
	^ 'Dependency removed'
]

{ #category : #accessing }
GtEpDependencyMarkedRemovedReason >> relatedEntries [
	^ dependencyEntry
		ifNil: [ dependentEntry ifNil: [ #() ] ifNotNil: [ { dependentEntry } ] ]
		ifNotNil: [ dependentEntry ifNil: [ { dependencyEntry } ] ifNotNil: [ { dependencyEntry. dependentEntry } ] ]
]
