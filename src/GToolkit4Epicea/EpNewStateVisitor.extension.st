Extension { #name : #EpNewStateVisitor }

{ #category : #'*GToolkit4Epicea' }
EpNewStateVisitor >> visitMethodUpdateNoSource: aMethodCreatedChange [
	^ self
		printProtocol: aMethodCreatedChange protocol
		sourceCode: aMethodCreatedChange sourceCode
]
