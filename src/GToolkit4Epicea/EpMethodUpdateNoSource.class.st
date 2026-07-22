Class {
	#name : #EpMethodUpdateNoSource,
	#superclass : #EpMethodAddition,
	#category : 'GToolkit4Epicea-Model'
}

{ #category : #visitor }
EpMethodUpdateNoSource >> accept: aVisitor [

	^ aVisitor visitMethodUpdateNoSource: self
]

{ #category : #testing }
EpMethodUpdateNoSource >> isEpMethodAddition [

	^ false
]

{ #category : #testing }
EpMethodUpdateNoSource >> isEpMethodUpdateNoSource [

	^ true
]
