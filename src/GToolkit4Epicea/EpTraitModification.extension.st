Extension { #name : #EpTraitModification }

{ #category : #'*GToolkit4Epicea' }
EpTraitModification >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldTrait = other oldTrait and: [ 
				self newTrait = other newTrait ] ] ]
]
