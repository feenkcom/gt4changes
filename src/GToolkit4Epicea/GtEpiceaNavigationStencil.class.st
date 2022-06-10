Class {
	#name : #GtEpiceaNavigationStencil,
	#superclass : #BrStencil,
	#instVars : [
		'navigationModel',
		'viewModel'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaNavigationStencil >> announce: anObject [ 
	self announcer announce: anObject
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> announcer [
	^ navigationModel announcer
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> changes [
	^ self navigationModel changes
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> create [

	^ GtGitNavigationElement new
		  navigationModel: self navigationModel;
		  addChild: (GtPhlowCompositeView new
				   views: (GtPhlowViewsCollector new
						    fromObject: self;
						    pragmaName: #gtEpiceaNavigation;
						    collect);
				   asElementDo: [ :aTabGroup | 
					   aTabGroup
						   background: BrGlamorousColors neutralBackgroundColor;
						   matchParent ])
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> createListFor: aView [
	<gtEpiceaNavigation>
	
	| element |
	^ aView columnedList
		title: 'Changes';
		items: [ self changes ];
		updateWhen: GtEpiceaChangeChanged in: self announcer;
		column: 'Active'
			stencil: [ :item | 
				item isActive
					ifTrue: [ BlElement new
							background: BrGlamorousColors selectedListItemColor;
							aptitude: (BrGlamorousWithLabelTooltipAptitude new text: 'Active');
							size: 12 @ 12;
							geometry: (BlRoundedRectangleGeometry cornerRadius: 6);
							margin: (BlInsets left: 14) ]
					ifFalse: [ BlElement new size: 12 @ 12 ] ]
			width: 38;
		column: 'Name' text: [ :change | change name ];
		column: 'From' text: [ :change | change startTime ];
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
		actionUpdateButtonTooltip: 'Reload list of changes'
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> initialize [
	super initialize.
	
	viewModel := GtEpiceaNavigationViewModel new
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> navigationModel [
	^ navigationModel
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> navigationModel: aNavigationModel [
	navigationModel := aNavigationModel
]
