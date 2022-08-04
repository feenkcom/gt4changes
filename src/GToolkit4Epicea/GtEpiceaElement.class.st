Class {
	#name : #GtEpiceaElement,
	#superclass : #BlElement,
	#traits : 'TGtPhlowToolDetailAdjustable + TBrLayoutResizable + TGtPagerPageInstantiator',
	#classTraits : 'TGtPhlowToolDetailAdjustable classTrait + TBrLayoutResizable classTrait + TGtPagerPageInstantiator classTrait',
	#instVars : [
		'titleNotifier',
		'change',
		'navigationModel',
		'contentElement',
		'sidebarElement'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaElement >> asElementDo: aBlock [
	^ aBlock value: self
]

{ #category : #accessing }
GtEpiceaElement >> change [
	^ change
]

{ #category : #accessing }
GtEpiceaElement >> contentElement [
	^ contentElement
]

{ #category : #accessing }
GtEpiceaElement >> defaultNavigationModel [
	^ GtEpiceaNavigationModel new
]

{ #category : #accessing }
GtEpiceaElement >> initialize [
	super initialize.
	self initializeTitleNotifier.
	self initializeListeners.
	self addInteractiveModelState: GtPhlowToolDetailModel new.
	self layout: BlLinearLayout horizontal.
	self addAptitude: BrLayoutResizerAptitude inherit.
	self initializeView.
	self navigationModel: self defaultNavigationModel.
	
	"TODO: put in proper place"
	GtEpiceaMonitor current enable.
]

{ #category : #accessing }
GtEpiceaElement >> initializeContentElement [
	| aViewModel |
	aViewModel := GtChangeViewModel new.
	change ifNotNil: [
		aViewModel changeModel: change].
	
	contentElement := GtEpiceaChangeElement new.
	contentElement navigationModel: navigationModel.
	contentElement changeViewModel: aViewModel.
]

{ #category : #accessing }
GtEpiceaElement >> initializeListeners [
]

{ #category : #accessing }
GtEpiceaElement >> initializeNavigationModel [
]

{ #category : #accessing }
GtEpiceaElement >> initializeSidebarElement [
	sidebarElement := GtPhlowHorizontalSidebarElement new beLeft.
	self addAptitude: (GtPhlowToolDetailAptitude new
		normal: [ :theInstance | sidebarElement hide ];
		detailed: [ :theInstance | sidebarElement show ]).
]

{ #category : #accessing }
GtEpiceaElement >> initializeTitleNotifier [
	titleNotifier := GtPhlowTitleIconAndLabelNotifier new
		shortLabel: [ self shortTitle ifEmpty: [ 'Changes' asRopedText ] ];
		icon: BrGlamorousVectorIcons changes.
	self addEventHandler: titleNotifier.
]

{ #category : #accessing }
GtEpiceaElement >> initializeView [

	self initializeContentElement.
	self initializeSidebarElement.

	self removeChildren.
	self addChild: self sidebarElement as: #sidebar.
	self
		addChild: (self contentElement padding: (BlInsets all: 5))
		as: #content.
]

{ #category : #accessing }
GtEpiceaElement >> navigationModel [
	^ navigationModel
]

{ #category : #accessing }
GtEpiceaElement >> navigationModel: aNavigationModel [
	navigationModel := aNavigationModel.
	self subscribeToNavigationModel.
	self onNavigationModelChanged
]

{ #category : #accessing }
GtEpiceaElement >> onNavigationModelChange: anEvent [
	change := anEvent change.
	self refreshView.
	self updateTabLabel.
	self fireEvent: (GtPhlowToolObjectChangeWish new object: change)
]

{ #category : #accessing }
GtEpiceaElement >> onNavigationModelChanged [
	self updateSidebarContent
]

{ #category : #accessing }
GtEpiceaElement >> refreshView [

	self initializeContentElement.

	self removeChildren.
	self addChild: self sidebarElement as: #sidebar.
	self
		addChild: (self contentElement padding: (BlInsets all: 5))
		as: #content.
]

{ #category : #accessing }
GtEpiceaElement >> shortTitle [

	^ change ifNil: [ '' ] ifNotNil: [ change name ]
]

{ #category : #accessing }
GtEpiceaElement >> sidebarElement [
	^ sidebarElement
]

{ #category : #accessing }
GtEpiceaElement >> subscribeToNavigationModel [
	self navigationModel weak 
		when: GtEpiceaChangeSelected
		send: #onNavigationModelChange: to: self
]

{ #category : #accessing }
GtEpiceaElement >> titleNotifier [
	^ titleNotifier
]

{ #category : #accessing }
GtEpiceaElement >> updateSidebarContent [
	self sidebarElement
		contentStencil: (GtEpiceaNavigationStencil new 
			navigationModel: self navigationModel)
]

{ #category : #accessing }
GtEpiceaElement >> updateTabLabel [
	self titleNotifier notify
]
