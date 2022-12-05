Class {
	#name : #GtEpiceaMethodHistory,
	#superclass : #Object,
	#instVars : [
		'changes',
		'targetMethod',
		'latestChange'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaMethodHistory >> changes [

	^ changes
]

{ #category : #accessing }
GtEpiceaMethodHistory >> changes: anObject [

	changes := anObject
]

{ #category : #accessing }
GtEpiceaMethodHistory >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries List';
		priority: 10;
		object: [ self changes ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtEpiceaMethodHistory >> latestChange [ 
	^ latestChange ifNil:  [
		latestChange := self changes latestChange ]
]

{ #category : #acccessing }
GtEpiceaMethodHistory >> methodDisplayName [
	^ self targetMethod displayName
]

{ #category : #printing }
GtEpiceaMethodHistory >> printOn: aStream [
	super printOn: aStream.

	aStream
		parenthesize: [ 
			aStream << self methodDisplayName.
			aStream << ', '.
			aStream print: self changes size.
			aStream << ' '.
			aStream << ('change' asPluralBasedOn: self changes size) ]
]

{ #category : #accessing }
GtEpiceaMethodHistory >> targetMethod [

	^ targetMethod
]

{ #category : #accessing }
GtEpiceaMethodHistory >> targetMethod: anObject [

	targetMethod := anObject
]
