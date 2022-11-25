Extension { #name : #EpMonitor }

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewChangeFilesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Changes Files';
		priority: 25;
		object: [ self sessionStore ];
		view: #gtViewChangeFilesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewChangeTreeFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Changes Tree';
		priority: 45;
		object: [ self sessionStore ];
		view: #gtViewChangeTreeFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewEntriesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries';
		priority: 5;
		object: [ log ];
		view: #gtViewEntriesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries List';
		priority: 10;
		object: [ log ];
		view: #gtViewEntriesListFor:
]
