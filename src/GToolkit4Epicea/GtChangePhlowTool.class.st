Class {
	#name : #GtChangePhlowTool,
	#superclass : #GtPhlowTool,
	#instVars : [
		'change',
		'navigationModel'
	],
	#category : 'GToolkit4Epicea-Tools'
}

{ #category : #accessing }
GtChangePhlowTool >> asElementDo: aBlock [
	| anElement |
	anElement := GtEpiceaElement new.
	self change ifNotNil: [ :aChange | 
		anElement change: aChange ].
	
	anElement
		when: GtPhlowToolObjectChangeWish
		do: [ :aWish | self change: aWish object ].

	^ aBlock value: anElement
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
