Class {
	#name : #GtChangePhlowTool,
	#superclass : #GtPhlowTool,
	#instVars : [
		'change',
		'navigationModel'
	],
	#category : #'GToolkit4Epicea-Tools'
}

{ #category : #accessing }
GtChangePhlowTool >> asElementDo: aBlock [
	^ aBlock value: GtEpiceaElement new
]

{ #category : #accessing }
GtChangePhlowTool >> change [

	^ change
]

{ #category : #accessing }
GtChangePhlowTool >> change: anObject [

	change := anObject
]

{ #category : #accessing }
GtChangePhlowTool >> icon [
	^ BrGlamorousVectorIcons changes
]

{ #category : #accessing }
GtChangePhlowTool >> name [
	^ 'Changes'
]

{ #category : #accessing }
GtChangePhlowTool >> navigationModel [

	^ navigationModel
]

{ #category : #accessing }
GtChangePhlowTool >> navigationModel: anObject [

	navigationModel := anObject
]

{ #category : #accessing }
GtChangePhlowTool >> tabLook [
	^ BrGlamorousTabSwitcherWithIconAptitude
]
