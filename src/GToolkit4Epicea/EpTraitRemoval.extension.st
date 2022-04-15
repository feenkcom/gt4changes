Extension { #name : #EpTraitRemoval }

{ #category : #'*GToolkit4Epicea' }
EpTraitRemoval >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self traitRemoved = other traitRemoved ] ]
]
