Extension { #name : #OmStore }

{ #category : #'*GToolkit4Epicea' }
OmStore >> entriesStream [
	^ self subclassResponsibility
]

{ #category : #'*GToolkit4Epicea' }
OmStore >> gtViewEntriesFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Entries';
		priority: 5;
		items: [ self entriesStream ];
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

{ #category : #'*GToolkit4Epicea' }
OmStore >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView list 
		title: 'Entries List';
		priority: 10;
		items: [ self entriesStream ]
]
