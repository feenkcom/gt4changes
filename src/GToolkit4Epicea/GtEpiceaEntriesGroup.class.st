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
		column: 'Event'
			text: [ :anOmbuEntry | anOmbuEntry content ];
		column: 'Event'
			text: [ :anOmbuEntry | anOmbuEntry gtTime printToSeconds ]
			width: 150
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> latestChange [
	^ self items detectMax: [ :anOmbuEntry | anOmbuEntry gtTime]
]
