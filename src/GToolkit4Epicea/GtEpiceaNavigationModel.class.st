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
		updateWhen: GtEpiceaLogAnnouncement in: GtEpiceaMonitor current;
		actionDropdownButtonIcon: BrGlamorousVectorIcons folder
			tooltip: 'Select change directory'
			content: [ :aDropdown | 
				BrFileSelector new
					folder: EpMonitor current sessionStore baseLocator;
					padding: (BlInsets all: 8);
					addAptitude: BrGlamorousWithHorizontalResizerAptitude new
							+ BrGlamorousWithHorizontalResizerAptitude new beLeft
							+ BrGlamorousWithVerticalResizerAptitude new;
					okAction: [ :srcFolder | 
						EpMonitor
							current: (EpMonitor
									newWithLog: (EpLog newWithStore: (OmSessionStore newWithBaseLocator: srcFolder))).
						aDropdown fireEvent: BrDropdownHideWish new.
						GtEpiceaMonitor current announce: GtEpiceaLogAnnouncement new ] ];
		actionDropdownButtonIcon: BrGlamorousVectorIcons add
			tooltip: 'New Log'
			content: [ :aDropdown :aTarget | 
				| s |
				s := GtEpiceaAddLogStencil new.
				s dropdown: aDropdown.
				s
					onCreated: [ :log | 
						aTarget viewContentElement phlow update.
						GtEpiceaMonitor current announce: GtEpiceaLogAnnouncement new.
						self announce: (GtEpiceaChangeSelected new change: log) ].
				s ];
		object: [ self changes ];
		view: #createListFor:
]
