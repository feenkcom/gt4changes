Extension { #name : #EpTraitAddition }

{ #category : #'*GToolkit4Epicea' }
EpTraitAddition >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self traitAdded = other traitAdded ] ]
]
