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
		'titleElement'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaChangeElement >> addToolbarButtons [

	| methods |
	methods := (Pragma allNamed: #gtChangeAction in: self class) 
		           collect: #methodSelector.
	methods do: [ :aSelector | self perform: aSelector ]
]

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
GtEpiceaChangeElement >> freezeThawButton [
	<gtChangeAction>

	self changeViewModel changeModel isActive ifFalse: [ 
		self changeViewModel changeModel isFrozen
			ifTrue: [ 
				toolbarElement addItem: (BrButton new
						 aptitude: BrGlamorousButtonWithLabelAptitude;
						 label: 'Thaw';
						 action: [ :aButton | 
							 self changeViewModel changeModel thaw.
							 aButton phlow fireUpdateWish ]) ]
			ifFalse: [ 
				toolbarElement addItem: (BrButton new
						 aptitude: BrGlamorousButtonWithLabelAptitude;
						 label: 'Freeze';
						 action: [ :aButton | 
							 self changeViewModel changeModel freeze.
							 aButton phlow fireUpdateWish ]) ] ]
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
				                                 aptitude:
					                                 BrGlamorousLabelAptitude new
						                                 bold;
				                                 text: '');
		                addChild: (GtPreviewChangeButton new
				                 icon: BrGlamorousVectorIcons remove;
				                 label: 'Remove';
						         margin: (BlInsets all: 3);
				                 changeAction: [ :aButton | 
					                 self changeViewModel remove.
					                 navigationModel announce:
							                 (GtEpiceaChangeSelected new change: nil).
					                 aButton phlow fireUpdateWish ];
				                 changeStencil: [ 
					                 BrVerticalPane new
						                 hFitContent;
						                 vFitContent;
						                 margin: (BlInsets all: 10);
						                 addChild: (BrLabel new
								                  aptitude:
									                  BrGlamorousLabelAptitude new
										                  glamorousRegularFont;
								                  text: 'Remove change?' asRopedText) ])
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
GtEpiceaChangeElement >> inspectButton [
	<gtChangeAction>
	
	toolbarElement addItem:
				((BrButton new)
						aptitude: BrGlamorousButtonWithIconAptitude;
						icon: BrGlamorousVectorIcons inspect;
						label: 'Inspect';
						action: [ :aButton | aButton phlow spawnObject: self changeViewModel changeModel ]).
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
	self labelElement text: self changeViewModel name asString
]

{ #category : #accessing }
GtEpiceaChangeElement >> updateToolbarElement [

	(self hasChangeViewModel not or: [ 
		 self changeViewModel hasChange not ]) ifTrue: [ ^ self ].
	toolbarElement removeAllItems.

	self addToolbarButtons
]
