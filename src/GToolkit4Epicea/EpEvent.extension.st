Extension { #name : #EpEvent }

{ #category : #'*GToolkit4Epicea' }
EpEvent >> affectedMarker [
	^ self printString
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> applyCodeChange [
	"noop"

]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> applyCodeChangeIfHasImpact [
	"Apply the receiver if it will change the system."

	self hasImpact ifTrue: [ self applyCodeChange ].
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> hasImpact [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpBehaviorCommentChange [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpBehaviorNameChange [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpClassAddition [

	^ false.
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpClassModification [

	^ false.
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpClassRemoval [

	^ false.
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpMethodAddition [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpMethodModification [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpMethodRemoval [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpProtocolAddition [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpProtocolRemoval [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpTraitAddition [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpTraitModification [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpTraitRemoval [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isGtEpReplayBehaviorAddition [
	"Answer a boolean indicating whether the receiver can be regarded as adding a behavior to the system."

	^ false.
]
