Trait {
	#name : #TGtEpiceaLogView,
	#category : #'GToolkit4Epicea-UI'
}

{ #category : #accessing }
TGtEpiceaLogView >> gtEntriesTreeViewFor: aView [
	<gtView>

	^ aView forward
		title: 'Entries Tree';
		priority: 20;
		object: [ self treeView ];
		view: #gtLiveFor:
]

{ #category : #accessing }
TGtEpiceaLogView >> treeView [

	^ self treeViewOn: self entries.
]

{ #category : #accessing }
TGtEpiceaLogView >> treeViewOn: aCollectionOfEntries [
	"Answer a mondrian tree view representing the receiver"
	| nodes mondrian |

	mondrian := GtMondrian new.
	nodes := GtEpiceaLogViewNode fromCollection: aCollectionOfEntries.
	mondrian nodes
		stencil: [ :entry |
			BrLabel new text: entry event gtDisplayString;
				aptitude: BrGlamorousLabelAptitude ];
		with: nodes.
	mondrian edges 
		connect: nodes from: #prior.
	"mondrian layout custom: GtGraphTreeLayout new verticallyReverse."
	mondrian layout custom: GtGraphTreeLayout new verticallyReverse.
	^ mondrian.
]
