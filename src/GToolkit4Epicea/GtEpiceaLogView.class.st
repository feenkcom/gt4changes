Class {
	#name : #GtEpiceaLogView,
	#superclass : #Object,
	#traits : 'TGtEpiceaLogView',
	#classTraits : 'TGtEpiceaLogView classTrait',
	#instVars : [
		'entries'
	],
	#category : #'GToolkit4Epicea-UI'
}

{ #category : #accessing }
GtEpiceaLogView >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaLogView >> entries: anObject [

	entries := anObject
]
