Extension { #name : #EpTraitAddition }

{ #category : #'*GToolkit4Epicea' }
EpTraitAddition >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self traitAdded = other traitAdded ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpTraitAddition >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self traitAdded hash)
]

{ #category : #'*GToolkit4Epicea' }
EpTraitAddition >> isEpTraitAddition [

	^ true
]

{ #category : #'*GToolkit4Epicea' }
EpTraitAddition >> isGtEpReplayBehaviorAddition [
	"Answer a boolean indicating whether the receiver can be regarded as adding a behavior to the system."

	^ true.
]
