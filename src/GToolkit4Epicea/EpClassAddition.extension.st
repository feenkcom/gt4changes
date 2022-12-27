Extension { #name : #EpClassAddition }

{ #category : #'*GToolkit4Epicea' }
EpClassAddition >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self classAdded = other classAdded ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpClassAddition >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self classAdded hash)
]

{ #category : #'*GToolkit4Epicea' }
EpClassAddition >> isEpClassAddition [

	^ true.
]

{ #category : #'*GToolkit4Epicea' }
EpClassAddition >> isGtEpReplayBehaviorAddition [
	"Answer a boolean indicating whether the receiver can be regarded as adding a behavior to the system."

	^ true.
]
