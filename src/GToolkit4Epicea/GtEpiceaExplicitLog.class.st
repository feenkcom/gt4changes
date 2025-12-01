Class {
	#name : #GtEpiceaExplicitLog,
	#superclass : #GtEpiceaAbstractLog,
	#instVars : [
		'entries'
	],
	#category : 'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpiceaExplicitLog class >> on: aCollectionOfEntries [
	^ self new entries: aCollectionOfEntries
]

{ #category : #accessing }
GtEpiceaExplicitLog >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaExplicitLog >> entries: anObject [

	entries := anObject
]

{ #category : #accessing }
GtEpiceaExplicitLog >> entriesStream [

	^ entries asAsyncStream
]

{ #category : #testing }
GtEpiceaExplicitLog >> isActive [
	^ false
]

{ #category : #accessing }
GtEpiceaExplicitLog >> log [
	^ nil
]

{ #category : #accessing }
GtEpiceaExplicitLog >> logs [
	^ {}
]

{ #category : #accessing }
GtEpiceaExplicitLog >> name [
	^ 'Explicit log on ', entries size asString, ' entries'
]

{ #category : #accessing }
GtEpiceaExplicitLog >> shouldUpdate [
	^ false
]

{ #category : #accessing }
GtEpiceaExplicitLog >> timeAt: anEntry [
	^ anEntry tags at: #time
]
