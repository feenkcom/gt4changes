Class {
	#name : #GtEpiceaLogView,
	#superclass : #Object,
	#traits : 'TGtEpiceaLogView',
	#classTraits : 'TGtEpiceaLogView classTrait',
	#instVars : [
		'entries'
	],
	#category : 'GToolkit4Epicea-UI'
}

{ #category : #accessing }
GtEpiceaLogView >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaLogView >> entries: anObject [

	entries := anObject
]

{ #category : #accessing }
GtEpiceaLogView >> gtEntriesTreeViewFor: aView [
	<gtView>

	^ aView forward
		title: 'Entries tree';
		priority: 20;
		object: [ self treeView ];
		view: #gtLiveFor:
]
