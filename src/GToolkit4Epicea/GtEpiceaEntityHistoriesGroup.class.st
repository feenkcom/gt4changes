Class {
	#name : #GtEpiceaEntityHistoriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroup + TGtGroupItems',
	#classTraits : 'TGtGroup classTrait + TGtGroupItems classTrait',
	#category : #'GToolkit4Epicea-Model'
}

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
			sorted: [ :anEntityHistory | 
				anEntityHistory latestChange gtTime ] descending ];
		children: [ :anEntry | anEntry gtViewChangeHistoryChildren ];
		column: 'Details' do: [ :aColumn | 
			aColumn 
				cellStencil: [ GtEpiceaHistoryEntityDetailsElement new ];
				dataBinder: [ :anElement :anEntry | anElement updateForEntry: anEntry ] ];
		column: 'Changes Count' text: [ :anEntry | 
			| entryChangesCount |
			(anEntry class inheritsFrom: GtEpiceaEntityHistory)
				ifTrue: [
					entryChangesCount := anEntry gtViewChangesCount.
					entryChangesCount asString
						, ' '
						, ('change' asPluralBasedOn: entryChangesCount)] 
				ifFalse: [ '' ] ] width: 100;
		column: 'Timestamp' text: [ :anEntry | 
			anEntry gtViewLatestChangeTime printToSeconds ] width: 150
]

{ #category : #testing }
GtEpiceaEntityHistoriesGroup >> hasNoEffect [
	^ self items allSatisfy: [ :aMethodHistory |
		aMethodHistory hasNoEffect ]
]

{ #category : #accessing }
GtEpiceaEntityHistoriesGroup >> latestChange [
	^ (self items collect: [ :anEntityHistory | anEntityHistory latestChange ])
		detectMax: [ :anOmbuEntry | anOmbuEntry gtTime]
]

{ #category : #accessing }
GtEpiceaEntityHistoriesGroup >> sorted: aBlock [
	^ self species 
		withAll: (self items sorted: aBlock)
]
