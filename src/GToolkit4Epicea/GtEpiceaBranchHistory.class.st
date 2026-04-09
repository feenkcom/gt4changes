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
		(GtEpiceaEntriesGroup withAll: (aCollectionOfEntries sorted: GtOmEntrySortFunction new reversed))
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
GtEpiceaBranchHistory >> entries [

	^ changes entries
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtEventsFor: aView [
	<gtView>

	^ aView forward
		title: 'Change list';
		priority: 20;
		object: [ GtEpiceaExplicitLog on: changes items ];
		view: #gtEventsFor:
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

	^ Smalltalk ui icons iconNamed: #branch.
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewChangesCount [

	^ changes size
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewClassHistoriesFor: aView [
	<gtView>
	"<gtViewChanges>"
	
	^ aView forward 
		title: 'By class';
		priority: 46;
		object: [ (GtEpiceaExplicitLog on: self entries) classHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries list';
		priority: 50;
		object: [ self changes ];
		view: #gtItemsFor:
]

{ #category : #accessing }
GtEpiceaBranchHistory >> gtViewPackageHistoriesFor: aView [
	<gtView>
	"<gtViewChanges>"
	
	^ aView forward 
		title: 'By package';
		priority: 45;
		object: [ (GtEpiceaExplicitLog on: self entries) packageHistories ];
		view: #gtViewHistoriesFor: 
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
