Extension { #name : #EpProtocolChange }

{ #category : #'*GToolkit4Epicea' }
EpProtocolChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self protocol = other protocol ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpProtocolChange >> affectedMarker [
	"All protocol changes should be grouped together"

	^ { EpProtocolChange. self behaviorAffectedName }
]

{ #category : #'*GToolkit4Epicea' }
EpProtocolChange >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self protocol hash)
]
