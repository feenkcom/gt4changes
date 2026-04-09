Class {
	#name : #GtEpiceaHistoryBuilder,
	#superclass : #Object,
	#instVars : [
		'entriesGroup'
	],
	#category : 'GToolkit4Epicea-History'
}

{ #category : #actions }
GtEpiceaHistoryBuilder class >> buildHistoryForEntriesGroup: anEntriesGroup [
	^ (self forEntriesGroup: anEntriesGroup) buildHistory
]

{ #category : #'instance creation' }
GtEpiceaHistoryBuilder class >> forEntriesGroup: anEntriesGroup [
	^ self new 
		entriesGroup:  anEntriesGroup
]

{ #category : #actions }
GtEpiceaHistoryBuilder >> buildHistory [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GtEpiceaHistoryBuilder >> entriesGroup [

	^ entriesGroup
]

{ #category : #accessing }
GtEpiceaHistoryBuilder >> entriesGroup: anObject [

	entriesGroup := anObject
]
