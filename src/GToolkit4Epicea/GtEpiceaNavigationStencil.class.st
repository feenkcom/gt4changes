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

	^ GtEpiceaNavigationElement new
		  navigationModel: self navigationModel
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> initialize [
	super initialize.
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> navigationModel [
	^ navigationModel
]

{ #category : #accessing }
GtEpiceaNavigationStencil >> navigationModel: aNavigationModel [
	navigationModel := aNavigationModel
]
