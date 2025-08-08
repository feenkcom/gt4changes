Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit4Epicea' }
CompiledMethod >> gtIsAddedByTraitedClass [
	| traitSource |
	traitSource := self traitSource
		ifNil: [ nil ]
		ifNotNil: [ :aTraitCompositionElement |
			(aTraitCompositionElement
				traitDefining: self selector
				ifNone: [ nil ]) innerClass ].
	^ traitSource = TraitedClass
]
