Class {
	#name : #GtEpiceaMethodHistoriesGroup,
	#superclass : #GtEpiceaEntityHistoriesGroup,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #testing }
GtEpiceaMethodHistoriesGroup >> hasNoEffect [
	^ self items allSatisfy: [ :aMethodHistory |
		aMethodHistory hasNoEffect ]
]
