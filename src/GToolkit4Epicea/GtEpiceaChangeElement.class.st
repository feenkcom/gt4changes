Class {
	#name : #GtEpiceaChangeElement,
	#superclass : #BlElement,
	#instVars : [
		'navigationModel',
		'changeViewModel'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaChangeElement >> changeViewModel: aViewModel [ 
	changeViewModel := aViewModel
]

{ #category : #accessing }
GtEpiceaChangeElement >> navigationModel: aNavigationModel [ 
	navigationModel := aNavigationModel
]
