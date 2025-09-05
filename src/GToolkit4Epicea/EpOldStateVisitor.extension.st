Extension { #name : #EpOldStateVisitor }

{ #category : #'*GToolkit4Epicea' }
EpOldStateVisitor >> visitMethodUpdateNoSource: aMethodModification [

	^ self visitMethodAddition: aMethodModification
]
