Extension { #name : #EpLogNode }

{ #category : #'*GToolkit4Epicea' }
EpLogNode >> gtViewReferencedNodesFor: aView [
	<gtView>
	
	referencedNodes ifNil: [ ^ aView empty ].
	
	^ aView list 
		title: 'Referenced Nodes';
		priority: 45;
		items: [ self referencedNodes asArray ]
]
