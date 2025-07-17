Extension { #name : #Behavior }

{ #category : #'*GToolkit4Epicea' }
Behavior >> metaMethods [
	"Answer the receiver's methods.
	TraitedMetaclass overrides this to reject methods defined by TraitedClass."

	^ self methods
]
