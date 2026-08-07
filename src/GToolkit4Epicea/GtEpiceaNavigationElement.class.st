Class {
	#name : #GtEpiceaNavigationElement,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'navigationModel',
		'navigationView'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaNavigationElement >> createNavigationView [
	navigationView := GtPhlowCompositeView new
			views: (GtPhlowViewsCollector new
					fromObject: navigationModel;
					pragmaName: #gtEpiceaNavigation;
					collect);
			asElementDo: [ :aTabGroup | 
				aTabGroup
					background: BrGlamorousColors neutralBackgroundColor;
					matchParent ]
]

{ #category : #accessing }
GtEpiceaNavigationElement >> initialize [
	super initialize.
	self matchParent
]

{ #category : #accessing }
GtEpiceaNavigationElement >> navigationModel: aNavigationModel [
	navigationModel := aNavigationModel.	
	self subscribeToEpicea.
	self setupNavigationView.
]

{ #category : #accessing }
GtEpiceaNavigationElement >> navigationView [
	^ navigationView
]

{ #category : #accessing }
GtEpiceaNavigationElement >> setupNavigationView [
	self removeChildren.
	self createNavigationView.	
	self addChild: self navigationView
]

{ #category : #accessing }
GtEpiceaNavigationElement >> subscribeToEpicea [
	GtEpiceaMonitor current weak 
		when: GtEpiceaLogAnnouncement 
		send: #setupNavigationView 
		to: self
]
