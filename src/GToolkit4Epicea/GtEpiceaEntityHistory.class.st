Class {
	#name : #GtEpiceaEntityHistory,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaEntityHistory >> entries [
	"Answer all the receiver's {{gtClass:OmEntry}}s"

	^ self subclassResponsibility
]

{ #category : #ui }
GtEpiceaEntityHistory >> gtEventsFor: aView [
	<gtView>

	^ aView forward
		title: 'Change list';
		priority: 2;
		object: [ GtEpiceaExplicitLog on: self entries ];
		view: #gtEventsFor:
]

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
