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
		  column: 'Name' text: [:change | change log store globalName ];
		  column: 'From' text: [:change | change log startTime];
		  column: 'To' text: [:change | change log endTime];
		  send: [ :change | 
			  self announce: (GtEpiceaChangeSelected new change: change) ]
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
