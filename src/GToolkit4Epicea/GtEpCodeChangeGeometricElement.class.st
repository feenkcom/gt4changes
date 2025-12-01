Class {
	#name : #GtEpCodeChangeGeometricElement,
	#superclass : #BlElement,
	#instVars : [
		'node',
		'hasImpact'
	],
	#category : 'GToolkit4Epicea-UI'
}

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> backgroundElement [

	^ BlElement new
		geometry: BlCircleGeometry new;
		size: 50@50;
		background: self color
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> color [

	self event isEpBehaviorChange ifTrue: [ ^ Color red ].
	self event isEpCategoryChange ifTrue: [ ^ Color green ].
	self event isEpMethodChange ifTrue: [ ^ Color blue ].
	^ Color gray.

]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> event [

	^ node event
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> hasImpact [

	^ hasImpact
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> hasImpact: aBoolean [

	hasImpact := aBoolean.
	self updateDisplay.
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> initialize [

	super initialize.
	hasImpact := false.
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> node: aGtEpiceaLogViewNode [

	node := aGtEpiceaLogViewNode.
	self updateDisplay.
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> noImpactElement [

	^ BlElement new
		relocate: 5@5;
		geometry: BlCircleGeometry new;
		size: 40@40;
		background: Color white.
]

{ #category : #accessing }
GtEpCodeChangeGeometricElement >> updateDisplay [

	self removeChildren.
	self addChild: self backgroundElement.
	self hasImpact ifFalse:
		[ self addChild: self noImpactElement ].
]
