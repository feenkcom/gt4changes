Class {
	#name : #GtEpiceaChangeElement,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'navigationModel',
		'changeViewModel',
		'toolbarElement',
		'lazyTabsElement',
		'labelElement',
		'headerElement',
		'titleElement',
		'removeButton',
		'updater'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaChangeElement >> changeViewItems [

	| aChange collector context |
	self changeViewModel hasChange ifFalse: [ ^ #(  ) ].
	aChange := self changeViewModel changeModel.

	collector := GtPhlowViewsCollector new
		             fromObject: aChange;
		             pragmaName: #gtViewChanges.

	context := GtPhlowContext new.
	context optionAt: #changeViewModel put: self changeViewModel.

	collector context: context.

	^ collector collect
]

{ #category : #accessing }
GtEpiceaChangeElement >> changeViewModel [
	^ changeViewModel
]

{ #category : #accessing }
GtEpiceaChangeElement >> changeViewModel: aViewModel [ 
	changeViewModel := aViewModel.
	self updateElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> defaultLayout [
	^ BlLinearLayout vertical
]

{ #category : #accessing }
GtEpiceaChangeElement >> handleAnnouncement: anAnnouncement [
	(self changeViewModel hasChange not
		or: [ self changeViewModel shouldUpdate not ]) ifTrue: [ ^ self ].

	updater requestUpdate
]

{ #category : #accessing }
GtEpiceaChangeElement >> hasChangeViewModel [
	^ changeViewModel isNotNil
]

{ #category : #accessing }
GtEpiceaChangeElement >> headerElement [
	^ headerElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> initialize [
	super initialize.
	self initializeHeaderElement.
	self initializeLazyTabsElement.
	
	self addChild: self makeLabel as: #label.
	self addChild: self headerElement as: #header.
	self addChild: self lazyTabsElement as: #lazyTabs.
	
	self matchParent.
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeHeaderElement [

	headerElement := BrHorizontalPane new
		                 vFitContent;
		                 hMatchParent.

	self initializeTitleElement.
	self initializeToolbarElement.

	headerElement addChild: titleElement as: #title.
	headerElement addChild: toolbarElement as: #toolbar
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeLazyTabsElement [
	lazyTabsElement := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeTitleElement [
	titleElement := BrHorizontalPane new
			vFitContent;
			hMatchParent;
			addChild: (labelElement := BrLabel new
						aptitude: BrGlamorousLabelAptitude new bold;
						text: '').
	removeButton := GtPreviewChangeButton new
			icon: BrGlamorousVectorIcons remove;
			label: 'Remove';
			margin: (BlInsets all: 3);
			changeAction: [ :aButton | 
				self changeViewModel remove.
				navigationModel announce: (GtEpiceaChangeSelected new change: nil).
				navigationModel announce: GtEpiceaChangeRemoved new.
				aButton phlow fireToolUpdateWish ];
			changeStencil: [ BrVerticalPane new
					hFitContent;
					vFitContent;
					margin: (BlInsets all: 10);
					addChild: (BrLabel new
							aptitude: BrGlamorousLabelAptitude new glamorousRegularFont;
							text: 'Remove change?' asRopedText) ]
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeToolbarElement [

	toolbarElement := BrToolbar new
		                  aptitude:
			                  (BrGlamorousToolbarAptitude new spacing: 5);
		                  fitContent;
		                  margin: (BlInsets bottom: 5)
]

{ #category : #accessing }
GtEpiceaChangeElement >> labelElement [
	^ labelElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> lazyTabsElement [
	^ lazyTabsElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> makeLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize
				foreground: Color gray;
				fontSize: 12);
		text: 'Changes'
]

{ #category : #accessing }
GtEpiceaChangeElement >> navigationModel: aNavigationModel [ 
	navigationModel := aNavigationModel
]

{ #category : #accessing }
GtEpiceaChangeElement >> newChangeViewTabs [
	<return: #BrTabGroup>

	| tabsElement |
	tabsElement := GtPhlowCompositeView new
		views: self changeViewItems;
		asElementDo: [ :aBrTabGroup | aBrTabGroup ].

	^ tabsElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> subscribeToSignals [

	updater := BrElementUpdater new.
	updater postponedDuration: 1 seconds.
	updater element: self.
	updater action: [ :e | 
		e updateElement.
		updater resetUpdateRequested ].
	GtEpiceaMonitor current weak
		when: GtEpiceaLogAnnouncement
		send: #handleAnnouncement:
		to: self
]

{ #category : #accessing }
GtEpiceaChangeElement >> titleElement [
	^ titleElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> toolbarElement [
	^ toolbarElement
]

{ #category : #accessing }
GtEpiceaChangeElement >> updateElement [
	self updateTabsElement.
	self updateToolbarElement.
	self updateTitleElement.
	self subscribeToSignals.
]

{ #category : #accessing }
GtEpiceaChangeElement >> updateTabsElement [

	self lazyTabsElement removeChildren.
	self lazyTabsElement addChild: (self newChangeViewTabs id: #tabs)
]

{ #category : #accessing }
GtEpiceaChangeElement >> updateTitleElement [
	(self hasChangeViewModel not or: [ 
		 self changeViewModel hasChange not ]) ifTrue: [ ^ self ].
	self labelElement text: self changeViewModel name asString.
	
	self titleElement removeChildNamed: #removebtn.
	
	self titleElement addChild: removeButton as: #removebtn
]

{ #category : #accessing }
GtEpiceaChangeElement >> updateToolbarElement [

	(self hasChangeViewModel not or: [ 
		 self changeViewModel hasChange not ]) ifTrue: [ ^ self ].
	toolbarElement removeAllItems.
]
