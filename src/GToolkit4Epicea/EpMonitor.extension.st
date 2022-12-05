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

{ #category : #'*GToolkit4Epicea' }
EpMonitor class >> shutDown: isImageQuitting [
	"If enabled, record a snapshot event.
	Always open a new file on snapshot"

	self hasCurrent ifTrue:
		[ (isImageQuitting not and: [ self current isEnabled ]) ifTrue: 
			[ self current sessionSnapshot ].
		self current sessionStore flush.
		"Force a new log file on every image save.
		self current log store resetWithNextStoreName." ].
]
