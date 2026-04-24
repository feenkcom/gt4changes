Class {
	#name : #GtEpBehaviorDefinitionMatchesReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'matchingEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpBehaviorDefinitionMatchesReason class >> matchingEntry: anEntry [

	^ self new matchingEntry: anEntry
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> behaviorName [

	^ matchingEntry content behaviorAffectedName
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> explanation [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Superseded because ';
			print: self behaviorName;
			nextPutAll: ' matches the current behavior' ]
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> kind [
	^ #behaviorDefinitionMatches
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> label [
	^ 'Final behavior definition matches'
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> matchingEntry [
	^ matchingEntry
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> matchingEntry: anObject [
	matchingEntry := anObject
]

{ #category : #accessing }
GtEpBehaviorDefinitionMatchesReason >> relatedEntries [
	^ matchingEntry
		ifNil: [ #() ]
		ifNotNil: [ { matchingEntry } ]
]
