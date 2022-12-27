Extension { #name : #EpTraitRemoval }

{ #category : #'*GToolkit4Epicea' }
EpTraitRemoval >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self traitRemoved = other traitRemoved ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpTraitRemoval >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self traitRemoved hash)
]

{ #category : #'*GToolkit4Epicea' }
EpTraitRemoval >> isEpTraitRemoval [

	^ true
]
