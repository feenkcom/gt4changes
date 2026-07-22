Class {
	#name : #GtEpiceaEntriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems',
	#classTraits : 'TGtGroupWithItems classTrait',
	#category : 'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaEntriesGroup >> asAsyncStream [
	^ AsyncSequenceStream forCollection: self
]

{ #category : #'accessing - filtering' }
GtEpiceaEntriesGroup >> behaviorChanges [
	^ self select: [ :anOmbuEntry |
		anOmbuEntry content isEpBehaviorChange ]
]

{ #category : #'accessing - grouping' }
GtEpiceaEntriesGroup >> behaviorChangesGroupedByClass [
	^ self behaviorChanges 
		groupedBy: [ :anOmbuEntry | 
			anOmbuEntry content behaviorAffected instanceSide ]
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> changesGroupedByBranch [
	| headNodes |

	headNodes := GtEpiceaUtilities branchesHeadLogNodesFrom: self items.
	^ headNodes collect: [ :node | node entry -> node entries ].
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> classHistories [
	^ GtEpiceaClassesHistoryBuilder 
		buildHistoryForEntriesGroup: self
]

{ #category : #enumerating }
GtEpiceaEntriesGroup >> detectMax: aBlock [
	^ self items detectMax: aBlock
]

{ #category : #enumerating }
GtEpiceaEntriesGroup >> detectMaxCollateWith: aSortFunction [
	^ self items detectMaxCollateWith: aSortFunction
]

{ #category : #enumerating }
GtEpiceaEntriesGroup >> detectMin: aBlock [
	^ self items detectMin: aBlock
]

{ #category : #enumerating }
GtEpiceaEntriesGroup >> detectMinCollateWith: aSortFunction [
	^ self items detectMinCollateWith: aSortFunction
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> entries [

	^ self items
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtChangesListFor: aView [
	<gtView>

	^ aView forward
		title: 'Change list';
		priority: 10;
		object: [ GtEpiceaExplicitLog on: self items ];
		view: #gtEventsFor:
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtItemsFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Entries';
		priority: 5;
		items: [ self items sorted: GtOmEntrySortFunction new reversed ];
		column: 'Icon'
			icon: [ :anOmbuEntry | 
				anOmbuEntry gtViewChangeIcon ]
			width: 32;
		column: 'Method' do: [ :aColumn |
			aColumn 
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: 26 ] ];
				dataBinder: [ :anElement :anOmbuEntity | 
					anElement
						removeChildren;
						addChildren: (anOmbuEntity content 
							accept: GtEpiceaBrickVisitor new) ] ]; 
		column: 'Timestamp'
			text: [ :anOmbuEntry | anOmbuEntry gtTime printToSeconds ]
			width: 150
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtViewClassHistoriesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'By class';
		priority: 35;
		object: [ self classHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtViewMethodHistoriesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'By method';
		priority: 35;
		object: [ self methodHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtViewPackageHistoriesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'By package';
		priority: 45;
		object: [ self packageHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> initialChange [
	^ self items detectMinCollateWith: GtOmEntrySortFunction new.
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> latestChange [
	^ self items detectMaxCollateWith: GtOmEntrySortFunction new
]

{ #category : #'accessing - filtering' }
GtEpiceaEntriesGroup >> methodChanges [
	^ self select: [ :anOmbuEntry |
		anOmbuEntry content isEpMethodChange ]
]

{ #category : #'accessing - grouping' }
GtEpiceaEntriesGroup >> methodChangesGroupedByAffectedMethod [
	^ self methodChanges
		groupedBy: [ :anOmbuEntry | 
			anOmbuEntry content methodAffected ]
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> methodHistories [
	^ GtEpiceaMethodsHistoryBuilder
		buildHistoryForEntriesGroup: self
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> packageHistories [
	^ GtEpiceaPackagesHistoryBuilder 
		buildHistoryForEntriesGroup: self
]

{ #category : #sorting }
GtEpiceaEntriesGroup >> sorted: aBlock [
	^ self species 
		withAll: (self items sorted: aBlock)
]

{ #category : #sorting }
GtEpiceaEntriesGroup >> sortedDescendingByChangeTime [
	^ self sorted: GtOmEntrySortFunction new reversed
]
