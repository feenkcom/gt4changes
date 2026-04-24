"
Reason describing that a required entry has a dependency that cannot be found in the model or environment.
"
Class {
	#name : #GtEpDependencyNotFoundReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'dependencyName',
		'dependentEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpDependencyNotFoundReason class >> dependencyName: aSymbol dependentEntry: aGtEpSequencerEntry [
	^ self new
		dependencyName: aSymbol;
		dependentEntry: aGtEpSequencerEntry;
		yourself
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> dependencyName [
	^ dependencyName
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> dependencyName: aSymbol [
	dependencyName := aSymbol
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> dependentEntry [
	^ dependentEntry
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> dependentEntry: aGtEpSequencerEntry [
	dependentEntry := aGtEpSequencerEntry
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> explanation [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Required entry depends on ';
			print: dependencyName;
			nextPutAll: ' but it was not found in the model or environment' ]
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> kind [
	^ #dependencyNotFound
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> label [
	^ 'Dependency not found'
]

{ #category : #accessing }
GtEpDependencyNotFoundReason >> relatedEntries [
	^ dependentEntry ifNil: [ #() ] ifNotNil: [ { dependentEntry } ]
]
