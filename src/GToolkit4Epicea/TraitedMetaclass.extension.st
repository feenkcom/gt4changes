Extension { #name : #TraitedMetaclass }

{ #category : #'*GToolkit4Epicea' }
TraitedMetaclass >> metaMethods [
	"Answer the receiver's methods, rejecting methods defined by TraitedClass, which have been added to the receiver's method dictionary - at least in Pharo11 and Pharo12."

	^ self methods reject: [ :each | | traitSource |
		traitSource := each traitSource
			ifNil: [ nil ]
			ifNotNil: [ :aTraitCompositionElement |
				(aTraitCompositionElement
					traitDefining: each selector
					ifNone: [ nil ]) innerClass ].
		traitSource = TraitedClass ]
]
