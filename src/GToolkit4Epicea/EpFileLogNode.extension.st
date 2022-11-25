Extension { #name : #EpFileLogNode }

{ #category : #'*GToolkit4Epicea' }
EpFileLogNode >> gtDisplayOn: aStream [ 
	super gtDisplayOn: aStream.
	
	aStream parenthesize: [
		aStream 
			<< self globalName;
			<< ', ';
			print: self modificationTime;
			<< ' - ';
			<< self modificationTimeString ]
]

{ #category : #'*GToolkit4Epicea' }
EpFileLogNode >> gtViewEntriesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries';
		priority: 5;
		object: [ self log ];
		view: #gtViewEntriesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpFileLogNode >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries List';
		priority: 10;
		object: [ self log ];
		view: #gtViewEntriesListFor:
]
