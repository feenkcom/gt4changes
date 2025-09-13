Extension { #name : #EpLog }

{ #category : #'*GToolkit4Epicea' }
EpLog >> endTime [

	self entries ifEmpty: [ ^ nil ].
	^ self timeAt: self entries last
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> entriesStream [
	^ store entriesStream
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> gtEntriesTreeViewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Changes tree';
		priority: 20;
		stencil: [ GtEpiceaLogView new treeViewOn: self entries ]
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> gtReset [
	store reset
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> gtViewEntriesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries';
		priority: 5;
		object: [ store ];
		view: #gtViewEntriesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries list';
		priority: 10;
		object: [ store ];
		view: #gtViewEntriesListFor:
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> startTime [

	^ store entriesStream next wait
		  ifSome: [ :aValue | self timeAt: aValue ifAbsent: [nil]]
		  ifNone: [ nil ]
]
