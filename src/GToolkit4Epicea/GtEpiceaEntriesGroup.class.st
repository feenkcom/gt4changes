Class {
	#name : #GtEpiceaEntriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroup + TGtGroupItems',
	#classTraits : 'TGtGroup classTrait + TGtGroupItems classTrait',
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtItemsFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Entries List';
		priority: 5;
		items: [ self ];
		column: 'Icon'
			icon: [ :anOmbuEntry | 
				anOmbuEntry content accept: EpIconVisitor new ]
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
GtEpiceaEntriesGroup >> initialChange [
	^ self items detectMin: [ :anOmbuEntry | anOmbuEntry gtTime]
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> latestChange [
	^ self items detectMax: [ :anOmbuEntry | anOmbuEntry gtTime]
]
