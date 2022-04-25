Extension { #name : #EpInverseVisitor }

{ #category : #'*GToolkit4Epicea' }
EpInverseVisitor >> visitTraitModification: aTraitModification [

	^ EpTraitModification
		  oldTrait: aTraitModification newTrait
		  newTrait: aTraitModification oldTrait
]
