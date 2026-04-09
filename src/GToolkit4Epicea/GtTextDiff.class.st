Class {
	#name : #GtTextDiff,
	#superclass : #TextDiffBuilder,
	#instVars : [
		'stylerStencil'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtTextDiff >> newStyler [
	^ stylerStencil ifNotNil: [ :aStencil | aStencil create ]
]

{ #category : #'gt - extensions' }
GtTextDiff >> styler: aStencil [
	"Stencil is an object that understands #create message.
	The stencil must return a {{gtClass:BlTextStyler}} instance."

	stylerStencil := aStencil asStencil
]
