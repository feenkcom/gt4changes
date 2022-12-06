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
		children: [ :anEntry |
			anEntry gtViewChangeHistoryChildren ];
		column: 'Type ' do: [ :aColumn | 
			aColumn 
				width: 55;
				cellStencil: [ 
					BrHorizontalPane new
						alignCenter;
						fitContent;
						padding: (BlInsets left:10)];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChild: anEntry gtViewChangeIcon asElement ] ];
		column: 'Method' do: [ :aColumn |
			aColumn 
				cellStencil: [ 
					BrHorizontalPane new
						hFitContent;
						vExact: 26 ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChildren: anEntry gtViewChangeDescriptionElements ] ]; 
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
