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
		'labelElement'
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
GtEpiceaChangeElement >> hasChangeViewModel [
	^ changeViewModel isNotNil
]

{ #category : #accessing }
GtEpiceaChangeElement >> initialize [
	super initialize.
	self initializeToolbarElement.
	self initializeLazyTabsElement.
	
	self addChild: self toolbarElement as: #toolbar.
	self addChild: self lazyTabsElement as: #lazyTabs.
	
	self matchParent.
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeLazyTabsElement [
	lazyTabsElement := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #accessing }
GtEpiceaChangeElement >> initializeToolbarElement [

	toolbarElement := BrToolbar new
		                  aptitude:
			                  (BrGlamorousToolbarAptitude new spacing: 0);
		                  vFitContent;
		                  hMatchParent;
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

	| localDelete |
	(self hasChangeViewModel not or: [ 
		 self changeViewModel hasChange not ]) ifTrue: [ ^ self ].

	localDelete := false.

	toolbarElement removeAllItems.
	toolbarElement
		addItem: (labelElement := BrLabel new
				                 aptitude: BrGlamorousLabelAptitude new bold;
				                 beHugeSize;
				                 text: '');
		addItem: (GtPreviewChangeButton new
				 icon: BrGlamorousVectorIcons remove;
				 label: 'Remove';
				 changeAction: [ :aButton | 
					 localDelete
						 ifTrue: [ self changeViewModel remove ]
						 ifFalse: [ self changeViewModel forget ].
					 navigationModel announce:
							 (GtEpiceaChangeSelected new change: nil).
					 aButton phlow fireUpdateWish ];
				 changeStencil: [ 
					 BrVerticalPane new
						 hFitContent;
						 vFitContent;
						 margin: (BlInsets all: 10);
						 addChild: (BrLabel new
								  aptitude: BrGlamorousLabelAptitude new glamorousRegularFont;
								  text: 'Remove change?' asRopedText);
						 addChild: (BrHorizontalPane new
								  hFitContent;
								  vFitContent;
								  alignCenterLeft;
								  margin: (BlInsets top: 5);
								  addChild: (BrCheckbox new
										   aptitude: BrGlamorousCheckboxAptitude;
										   whenCheckedDo: [ localDelete := true ];
										   margin: (BlInsets right: 8);
										   whenUncheckedDo: [ localDelete := false ]);
								  addChild: (BrLabel new
										   aptitude: BrLabelAptitude new glamorousRegularFont;
										   text: 'Remove change from disk')) ]);
		addItem: (BrFrame new
				 vFitContent;
				 hMatchParent);
		addItem: (BrButton new
				 aptitude: BrGlamorousButtonWithIconAptitude;
				 icon: BrGlamorousVectorIcons inspect;
				 label: 'Inspect';
				 action: [ :aButton | 
					 aButton phlow spawnObject:
							 self changeViewModel changeModel ])
]
