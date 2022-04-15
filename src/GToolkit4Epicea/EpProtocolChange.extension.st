Extension { #name : #EpProtocolChange }

{ #category : #'*GToolkit4Epicea' }
EpProtocolChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self protocol = other protocol ] ]
]
