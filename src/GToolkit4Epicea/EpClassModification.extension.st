Extension { #name : #EpClassModification }

{ #category : #'*GToolkit4Epicea' }
EpClassModification >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldClass = other oldClass and: [ 
				self newClass = other newClass ] ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpClassModification >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName bitXor: (self oldClass hash bitXor: self newClass))
]

{ #category : #'*GToolkit4Epicea' }
EpClassModification >> isEpClassModification [

	^ true.
]

{ #category : #'*GToolkit4Epicea' }
EpClassModification >> isGtEpReplayBehaviorAddition [
	"Answer a boolean indicating whether the receiver can be regarded as adding a behavior to the system."

	^ true.
]
