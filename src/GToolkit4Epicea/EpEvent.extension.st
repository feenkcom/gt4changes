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
EpEvent >> hasImpact [

	^ false
]

{ #category : #'*GToolkit4Epicea' }
EpEvent >> isEpBehaviorCommentChange [

	^ false
]
