Class {
	#name : #GtEpiceaBranchHistory,
	#superclass : #GtEpiceaEntityHistory,
	#instVars : [
		'headEntry',
		'changes'
	],
	#category : #'GToolkit4Epicea-History'
}

{ #category : #'instance creation' }
GtEpiceaBranchHistory class >> forChanges: aCollectionOfEntries [

	^ self new changes:
		(GtEpiceaEntriesGroup withAll: (aCollectionOfEntries sorted: #gtTime descending))
]

{ #category : #accessing }
GtEpiceaBranchHistory >> changes [

	^ changes
]

{ #category : #accessing }
GtEpiceaBranchHistory >> changes: anObject [

	changes := anObject
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewChangeDescriptionElements [

	^ changes first gtViewChangeDescriptionElements
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewChangeHistoryChildren [

	^ changes
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewChangeIcon [

	^ Smalltalk ui icons iconNamed: #windowMinimizeInactive.
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewChangesCount [

	^ changes size
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries List';
		priority: 10;
		object: [ self changes ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtEpiceaBranchHistory >> headEntry [

	^ headEntry
]

{ #category : #accessing }
GtEpiceaBranchHistory >> headEntry: anObject [

	headEntry := anObject
]

{ #category : #accessing }
GtEpiceaBranchHistory >> latestChange [

	^ changes first
]
