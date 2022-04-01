Class {
	#name : #GtEpiceaNavigationModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'GToolkit4Epicea-View Model'
}

{ #category : #announcer }
GtEpiceaNavigationModel >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtEpiceaNavigationModel >> changes [
	^ GtEpiceaLog allInSessionStore
]
