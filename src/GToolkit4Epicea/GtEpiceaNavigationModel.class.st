Class {
	#name : #GtEpiceaNavigationModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'directory'
	],
	#category : #'GToolkit4Epicea-View Model'
}

{ #category : #announcer }
GtEpiceaNavigationModel >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtEpiceaNavigationModel >> changes [
	^ GtEpiceaCompositeLog forAllInStore: directory
]

{ #category : #accessing }
GtEpiceaNavigationModel >> createListFor: aView [
	<gtView>
	<gtEpiceaNavigation>
	^ aView forward
		title: 'Changes';
		send: [ :change | self announce: (GtEpiceaChangeSelected new change: change).
			change ];
		actionDropdownButtonIcon: BrGlamorousVectorIcons folder
			tooltip: 'Select change directory'
			content: [ :aDropdown | 
				BrFileSelector new
					folder: directory;
					padding: (BlInsets all: 8);
					addAptitude: BrGlamorousWithHorizontalResizerAptitude new
							+ BrGlamorousWithHorizontalResizerAptitude new beLeft
							+ BrGlamorousWithVerticalResizerAptitude new;
					fileFilterBlock: [ :aFileReference | 
						aFileReference isDirectory
							and: [ (FileSystemDirectoryEntry reference: aFileReference) isHidden not ] ];
					okAction: [ :srcFolder | 
						directory := srcFolder.
						aDropdown fireEvent: BrDropdownHideWish new.
						self announce: (GtEpiceaChangeSelected new change: nil).
						
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

{ #category : #accessing }
GtEpiceaNavigationModel >> initialize [
	super initialize.
	directory := EpMonitor current sessionStore baseLocator.
]
