Class {
	#name : #GtEpiceaChangeDisplayNode,
	#superclass : #Object,
	#instVars : [
		'description',
		'children',
		'icon'
	],
	#category : 'GToolkit4Epicea-UI'
}

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> children [
	^ children
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> children: anObject [
	children := anObject
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> description [
	^ description
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> gtViewChangeDescriptionElements [
	^ {BlTextElement new 
		padding: (BlInsets all: 0);
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		text: (description  asRopedText 
			bold; 
			glamorousRegularFont)}
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> gtViewChangeHistoryChildren [

	^ children
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> gtViewChangeIcon [

	^ BrGlamorousVectorIcons empty
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> gtViewLatestChangeTime [

	^ nil
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> icon [
	^ icon
]

{ #category : #accessing }
GtEpiceaChangeDisplayNode >> icon: anObject [
	icon := anObject
]
