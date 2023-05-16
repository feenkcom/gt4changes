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

{ #category : #converting }
GtEpiceaLogViewNode >> asArray [
	"Answer an Array containing the receiver and all prior nodes"

	^ Array streamContents: [ :stream | | node |
		node := self.
		[ stream nextPut: node.
		node := node prior.
		node isNotNil ] whileTrue ].
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
GtEpiceaLogViewNode >> gtChangeListFor: aView [
	<gtView>

	^ aView forward
		title: 'Change list';
		priority: 20;
		object: [ GtEpiceaExplicitLog on: 
			(self asArray collect: #entry) reversed ];
		view: #gtEventsFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtCurrentSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'Current source';
		priority: 45;
		object: [ self entry ];
		view: #gtCurrentSourceFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtDiffCurrentFor: aView [
	<gtView>

	^ aView forward
		title: 'Diff current';
		priority: 30;
		object: [ self entry ];
		view: #gtDiffCurrentFor:
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
		priority: 49;
		painting: [ :mondrian | self treeViewWith: mondrian ]
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtNewSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'New source';
		priority: 35;
		object: [ self entry ];
		view: #gtNewSourceFor:
]

{ #category : #accessing }
GtEpiceaLogViewNode >> gtOldSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'Old source';
		priority: 40;
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
	| nodes hasImpactSet |

	nodes := self asArray.
	hasImpactSet := GtEpEventSequencer
		sequence: (nodes collect: #entry)
		withCurrent: false.
	mondrian nodes
		stencil: [ :each |
			GtEpCodeChangeGeometricElement new
				node: each;
				hasImpact: (hasImpactSet includes: each entry). ];
		with: nodes.
	mondrian layout grid.
	^ mondrian.
]
