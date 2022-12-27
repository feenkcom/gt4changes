Extension { #name : #EpTraitModification }

{ #category : #'*GToolkit4Epicea' }
EpTraitModification >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldTrait = other oldTrait and: [ 
				self newTrait = other newTrait ] ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpTraitModification >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash
				bitXor: (self oldTrait hash bitXor: self newTrait hash))
]

{ #category : #'*GToolkit4Epicea' }
EpTraitModification >> isEpTraitModification [

	^ true
]
