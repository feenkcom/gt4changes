Class {
	#name : #GtEpiceaRBTextStyler,
	#superclass : #BrRBTextStyler,
	#category : #GToolkit4Epicea
}

{ #category : #private }
GtEpiceaRBTextStyler >> resolveStyleFor: aVariableNode [
	| value |
	value := super resolveStyleFor: aVariableNode.
	^ value = #invalid
		ifTrue: [ #default ]
		ifFalse: [ value ]
]
