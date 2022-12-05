Class {
	#name : #GtEpiceaClassHistoriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroup + TGtGroupItems',
	#classTraits : 'TGtGroup classTrait + TGtGroupItems classTrait',
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'gt - extensions' }
GtEpiceaClassHistoriesGroup >> gtViewChangeHistoryChildren [
	^ self items
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistoriesGroup >> gtViewClassHistoriesFor: aView [
	<gtView>
	
	^ aView columnedTree 
		title: 'Class Histories';
		priority: 20;
		items: [ self items 
			sorted: [ :aClassHistory | 
				aClassHistory latestChange gtTime ] descending ];
		children: [ :anEntry |
			anEntry gtViewChangeHistoryChildren ];
		column: 'Type ' do: [ :aColumn | 
			aColumn 
				width: 55;
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal alignCenter;
					padding: (BlInsets left:10);
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical fitContent ] ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChild: anEntry gtViewChangeIcon asElement ] ];
		column: 'Event' do: [ :aColumn |
			aColumn 
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: 26 ] ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChildren: anEntry gtViewChangeDescriptionElements ] ]"; 
		column: 'Changes Count' text: [ :anEntry | 
			anEntry class = GtEpiceaMethodHistory 
				ifTrue: [ 
					anEntry changes size asString
						, ' '
						, ('change' asPluralBasedOn: anEntry changes size) ] 
				ifFalse: [ '' ] ] width: 100" ;
		column: 'Timestamp' text: [ :anEntry | 
			(anEntry class = GtEpiceaClassHistory 
				ifTrue: [ 
					anEntry latestChange gtTime ] 
				ifFalse: [ anEntry gtTime ]) printToSeconds ] width: 150
]
