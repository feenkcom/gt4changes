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
	^ GtEpiceaCompositeLog forAllInSessionStore
]

{ #category : #accessing }
GtEpiceaNavigationModel >> createListFor: aView [
	<gtView>
	<gtEpiceaNavigation>
	^ aView forward
		title: 'Changes';
		send: [ :change | self announce: (GtEpiceaChangeSelected new change: change) ];
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'New Log'
			content: [ :aDropdown :aTarget | 
				| s |
				s := GtEpiceaAddLogStencil new.
				s dropdown: aDropdown.
				s
					onCreated: [ :log | 
						aTarget viewContentElement phlow update.
						self announce: GtEpiceaChangeAdded new.
						self announce: (GtEpiceaChangeSelected new change: log) ].
				s ];
		object: [ self changes ];
		view: #createListFor:
]
