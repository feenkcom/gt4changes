Class {
	#name : #GtChangeViewModel,
	#superclass : #Object,
	#instVars : [
		'changeModel'
	],
	#category : #'GToolkit4Epicea-View Model'
}

{ #category : #accessing }
GtChangeViewModel >> changeModel [
	^ changeModel
]

{ #category : #accessing }
GtChangeViewModel >> changeModel: aChange [
	changeModel := aChange
]

{ #category : #accessing }
GtChangeViewModel >> hasChange [
	^ self changeModel isNotNil
]

{ #category : #accessing }
GtChangeViewModel >> name [
	^ self changeModel name
]

{ #category : #accessing }
GtChangeViewModel >> remove [
	^ self changeModel log store fileReference ensureDelete
]

{ #category : #accessing }
GtChangeViewModel >> shouldUpdate [
	^ changeModel shouldUpdate
]
