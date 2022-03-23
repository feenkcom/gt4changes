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
	^ self changeModel log store globalName
]
