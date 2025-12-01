Class {
	#name : #GtEpiceaDiffElementWithLabelStencil,
	#superclass : #GtDiffElementWithLabelStencil,
	#instVars : [
		'ombuEntry'
	],
	#category : 'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaDiffElementWithLabelStencil >> createDiffContainer [
	| diffContainer |
	diffContainer := super createDiffContainer.

	self shouldHideDiff ifTrue: [
		^ diffContainer ].
	
	diffContainer addChild: (BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		icon: BrGlamorousVectorIcons accept;
		label: 'Accept';
		margin: (BlInsets top: 0 left: 5 bottom: 5 right: 0);
		action: [ self ombuEntry content applyCodeChange ]).
	
	^ diffContainer
]

{ #category : #accessing }
GtEpiceaDiffElementWithLabelStencil >> ombuEntry [
	^ ombuEntry
]

{ #category : #accessing }
GtEpiceaDiffElementWithLabelStencil >> ombuEntry: anObject [

	ombuEntry := anObject
]
