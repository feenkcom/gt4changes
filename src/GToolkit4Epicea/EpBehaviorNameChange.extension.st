Extension { #name : #EpBehaviorNameChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorNameChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldName = other oldName and: [ 
				self newName = other newName ] ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorNameChange >> isEpBehaviorNameChange [

	^ true
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorNameChange >> isGtEpReplayBehaviorAddition [
	"Answer a boolean indicating whether the receiver can be regarded as adding a behavior to the system."

	^ true.
]
