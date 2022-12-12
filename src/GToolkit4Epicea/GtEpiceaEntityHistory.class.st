Class {
	#name : #GtEpiceaEntityHistory,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-History'
}

{ #category : #'gt - extensions' }
GtEpiceaEntityHistory >> gtViewChangesCount [
	^ self subclassResponsibility
]

{ #category : #'gt - extensions' }
GtEpiceaEntityHistory >> gtViewLatestChangeTime [ 
	^ self latestChange  gtTime
]

{ #category : #accessing }
GtEpiceaEntityHistory >> latestChange [
	^ self subclassResponsibility
]
