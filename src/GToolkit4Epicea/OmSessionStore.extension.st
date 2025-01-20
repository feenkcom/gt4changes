Extension { #name : #OmSessionStore }

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> entriesStream [ 
	^ self store entriesStream
]

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> gtNextStoreNameBasedOnCurrentImage [
	^ self resetWithStoreNamed: (self storeNameStrategy 
		nextTo: (Smalltalk imageFile 
			basenameWithoutExtension, '.1')
			in: self directory)
]

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> gtPaintNodesTreeOn: aMondrianView [ 
	| nodes |
	nodes := EpFileLogNode fromAllLogsIn: self directory.
	nodes do: [ :node | node populateReferencedNodesWith: nodes  ].
	
	aMondrianView nodes
		stencil: [ :each | 
			BrLabel new text: each globalName;
				aptitude: BrGlamorousLabelAptitude. ];
		with: nodes.
		
	aMondrianView edges 
		fromCenterBottom;
		toCenterTop;
		shape: [ :each | 
			BlLineElement new 
				zIndex: -1; 
				border: (BlBorder 
					paint: (Color gray alpha: 0.3) 
					width: 1);
				toHead: (BlArrowheadSimpleArrow new
					border: (BlBorder builder 
						paint: (Color gray alpha: 0.2); 
						width: 2; 
						build))  ];
		connectToAll: #referencedNodes.
		
	aMondrianView layout tree nodeDistance: 10; levelDistance: 40.
]

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> gtViewBaseDirectoryFor: aView [
	<gtView>
	baseLocator ifNil: [ ^ aView empty ].
	
	^ aView forward 
		title: 'Base directory';
		object: [ self baseLocator ];
		view: #gtItemsFor: 
]

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> gtViewChangeFilesFor: aView [
	<gtView>
	 
	^ aView columnedList 
		title: 'Changes files';
		items: [
			| nodes |
			nodes := EpFileLogNode fromAllLogsIn: self directory.
			nodes sorted: [ :a :b | 
				a modificationTime >= b modificationTime ] ];
		column: 'File name' text: [ :aFileLogNode |
			aFileLogNode globalName ];
		column: 'Modification Time' text: [ :aFileLogNode |
			aFileLogNode modificationTimeString ] width: 150;
		column: 'Modification Time' text: [ :aFileLogNode |
			aFileLogNode modificationTime ] width: 200
]

{ #category : #'*GToolkit4Epicea' }
OmSessionStore >> gtViewChangeTreeFor: aView [
	<gtView>
	 
	^ aView mondrian 
		title: 'Changes tree';
		painting: [ :aMondrianView |			
			self gtPaintNodesTreeOn: aMondrianView ]
]
