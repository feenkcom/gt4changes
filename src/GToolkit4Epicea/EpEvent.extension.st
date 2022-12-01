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
