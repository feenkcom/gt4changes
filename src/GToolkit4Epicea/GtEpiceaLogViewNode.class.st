"
nil
"
Class {
	#name : #GtEpiceaLogViewNode,
	#superclass : #Object,
	#instVars : [
		'entry',
		'prior'
	],
	#category : #'GToolkit4Epicea-UI'
}

{ #category : #'instance creation' }
GtEpiceaLogViewNode class >> fromCollection: aCollectionOfEntries [
	| entriesDictionary |

	entriesDictionary := Dictionary new.
	aCollectionOfEntries do: [ :entry |
		entriesDictionary
			at: (entry tagAt: #self)
			put: (self new entry: entry) ].
	entriesDictionary do: [ :entry |
		entry prior: (entriesDictionary at: (entry entry tagAt: #prior) ifAbsent: [ nil ]) ].
	^ entriesDictionary values.
]

{ #category : #accessing }
GtEpiceaLogViewNode >> apply [

	self event isCodeChange ifFalse: [ ^ self ].
	self event applyCodeChange.

]

{ #category : #accessing }
GtEpiceaLogViewNode >> entries [
	| node |

	^ Array streamContents: [ :stream |
		node := self.
		[ stream nextPut: node entry.
		node := node prior.
		node isNotNil ] whileTrue ].
]

{ #category : #accessing }
GtEpiceaLogViewNode >> entry [

	^ entry
]

{ #category : #accessing }
GtEpiceaLogViewNode >> entry: anObject [

	entry := anObject
]

{ #category : #accessing }
GtEpiceaLogViewNode >> event [

	^ entry content
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtActionApplyAllFor: anAction [
	"Inspect a GtEpEventSequencer on the receiver's chain, allowing inspection and confirmation of the apply action"
	<gtAction>

	prior ifNil: [ ^ anAction noAction ].
	^ anAction button
		label: 'Apply All...';
		priority: 10;
		action: [ :button | button phlow spawnObject: 
			(GtEpEventSequencer entries: self entries includeCurrent: false) ].
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtActionApplyFor: anAction [
	<gtAction>

	self event isCodeChange ifFalse: [ ^ anAction noAction ].
	^ anAction button
		label: 'Apply';
		priority: 10;
		action: [ self apply ].
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtDiffFor: aView [
	<gtView>

	^ aView forward
		title: 'Diff';
		priority: 25;
		object: [ self entry ];
		view: #gtDiffFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtDisplayOn: aStream [

	entry gtDisplayOn: aStream
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtEntriesTreeViewFor: aView [
	<gtView>

	^ aView mondrian
		title: 'Entries';
		priority: 20;
		painting: [ :mondrian | self treeViewWith: mondrian ]
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtNewSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'New Source';
		priority: 30;
		object: [ self entry ];
		view: #gtNewSourceFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtOldSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'New Source';
		priority: 35;
		object: [ self entry ];
		view: #gtOldSourceFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	self gtDisplayOn: aStream.
	aStream nextPut: $).
]

{ #category : #accessing }
GtEpiceaLogViewNode >> prior [

	^ prior
]

{ #category : #accessing }
GtEpiceaLogViewNode >> prior: anObject [

	prior := anObject
]

{ #category : #accessing }
GtEpiceaLogViewNode >> treeViewWith: mondrian [
	"Answer a mondrian tree view representing the receiver"
	| nodes |

	nodes := GtEpiceaLogViewNode fromCollection: self entries.
	mondrian nodes
		stencil: [ :each | | color |
			color := Color gray.
			each event isEpBehaviorChange ifTrue: [ color := Color red ].
			each event isEpCategoryChange ifTrue: [ color := Color green ].
			each event isEpMethodChange ifTrue: [ color := Color blue ].
			BlElement new
				geometry: BlCircleGeometry new;
				size: 50@50;
				background: color. ];
		with: nodes.
	mondrian layout grid.
	^ mondrian.
]
