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
				anOmbuEntry gtViewChangeIcon ]
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
		title: 'Entries list';
		priority: 10;
		items: [ self entriesStream ]
]

{ #category : #'*GToolkit4Epicea' }
OmStore >> isFileStore [
	"Answer a boolean indicating whether the receiver has a disk file as the store"
	
	^ true
]

{ #category : #'*GToolkit4Epicea' }
OmStore >> isMemoryStore [
	"Answer a boolean indicating if the current store is memory only (or on disk)"

	^ false
]
