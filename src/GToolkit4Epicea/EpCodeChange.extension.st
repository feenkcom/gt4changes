Extension { #name : #EpCodeChange }

{ #category : #'*GToolkit4Epicea' }
EpCodeChange >> hasImpact [
	"Answer a boolean indicating whether the receiver has an impact on the currently running system."

	^ self accept: (EpHasImpactVisitor inEnvironment: self class environment)
]
