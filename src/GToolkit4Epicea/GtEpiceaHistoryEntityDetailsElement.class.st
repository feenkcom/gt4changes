Class {
	#name : #GtEpiceaHistoryEntityDetailsElement,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'iconContainerElement',
		'detailsContainerElement'
	],
	#category : #'GToolkit4Epicea-UI'
}

{ #category : #initialization }
GtEpiceaHistoryEntityDetailsElement >> initialize [
	super initialize.
	
	self fitContent.
	self alignCenter.
	
	self initializeIconContainer.
	self initializeDetailsContainer.
	
	self addChildren: {
		iconContainerElement .
		detailsContainerElement.
	}
]

{ #category : #initialization }
GtEpiceaHistoryEntityDetailsElement >> initializeDetailsContainer [
	detailsContainerElement := BrHorizontalPane new
		hFitContent;
		vExact: 26
]

{ #category : #initialization }
GtEpiceaHistoryEntityDetailsElement >> initializeIconContainer [
	iconContainerElement := BrHorizontalPane new
		alignCenter;
		fitContent;
		padding: (BlInsets left: 5 right: 5)
]

{ #category : #updating }
GtEpiceaHistoryEntityDetailsElement >> updateForEntry: anEntry [
	iconContainerElement
		removeChildren;
		addChild: anEntry gtViewChangeIcon asElement.
		
	detailsContainerElement
		removeChildren;
		addChildren: anEntry gtViewChangeDescriptionElements
]
