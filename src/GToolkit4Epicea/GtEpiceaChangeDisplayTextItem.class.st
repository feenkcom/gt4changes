Class {
	#name : #GtEpiceaChangeDisplayTextItem,
	#superclass : #Object,
	#instVars : [
		'text',
		'icon'
	],
	#category : 'GToolkit4Epicea-UI'
}

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> gtViewChangeDescriptionElements [
	^ {BlTextElement new 
		padding: (BlInsets all: 0);
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		text: text  asRopedText }
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> gtViewChangeHistoryChildren [

	^ #()
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> gtViewChangeIcon [

	^ icon ifNil: [ Smalltalk ui icons iconNamed: #string ]
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> gtViewLatestChangeTime [

	^ nil
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> icon [
	^ icon
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> text [
	^ text
]

{ #category : #accessing }
GtEpiceaChangeDisplayTextItem >> text: anObject [
	text := anObject
]
