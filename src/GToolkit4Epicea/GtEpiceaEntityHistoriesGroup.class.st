Class {
	#name : #GtEpiceaEntityHistoriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems',
	#classTraits : 'TGtGroupWithItems classTrait',
	#category : 'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaEntityHistoriesGroup >> entries [

	^ self items flatCollect: #entries
]

{ #category : #'gt - extensions' }
GtEpiceaEntityHistoriesGroup >> gtViewChangeHistoryChildren [
	^ self items
]

{ #category : #'gt - extensions' }
GtEpiceaEntityHistoriesGroup >> gtViewChangesCount [
	^ self items sumNumbers: [ :aHistory | 
		aHistory gtViewChangesCount ]
]

{ #category : #'gt - extensions' }
GtEpiceaEntityHistoriesGroup >> gtViewHistoriesFor: aView [
	<gtView>
	
	^ aView columnedTree 
		title: 'Histories';
		priority: 20;
		items: [ self items 
			sorted: (GtEpiceaUtilities omEntrySortFunctionFor: #latestChange) reversed ];
		children: [ :anEntry | anEntry gtViewChangeHistoryChildren ];
		column: 'Details' do: [ :aColumn | 
			aColumn 
				cellStencil: [ GtEpiceaHistoryEntityDetailsElement new ];
				dataBinder: [ :anElement :anEntry | anElement updateForEntry: anEntry ] ];
		column: 'Number of Changes' text: [ :anEntry | 
			| entryChangesCount |
			(anEntry class inheritsFrom: GtEpiceaEntityHistory)
				ifTrue: [
					entryChangesCount := anEntry gtViewChangesCount.
					entryChangesCount asString
						, ' '
						, ('change' asPluralBasedOn: entryChangesCount)] 
				ifFalse: [ '' ] ] width: 120;
		column: 'Timestamp' text: [ :anEntry | 
			anEntry gtViewLatestChangeTime printToSeconds ] width: 150
]

{ #category : #testing }
GtEpiceaEntityHistoriesGroup >> hasEffect [
	^ self hasNoEffect not
]

{ #category : #testing }
GtEpiceaEntityHistoriesGroup >> hasNoEffect [
	^ self items allSatisfy: [ :aMethodHistory |
		aMethodHistory hasNoEffect ]
]

{ #category : #accessing }
GtEpiceaEntityHistoriesGroup >> latestChange [
	^ (self items collect: [ :anEntityHistory | anEntityHistory latestChange ])
		detectMaxCollateWith: GtOmEntrySortFunction new
]

{ #category : #sorting }
GtEpiceaEntityHistoriesGroup >> sortedDescendingByLatestChangeTime [
	^ self sorted: (GtEpiceaUtilities omEntrySortFunctionFor: #latestChange) reversed
]
