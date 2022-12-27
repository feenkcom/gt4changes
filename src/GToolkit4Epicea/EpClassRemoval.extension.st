Extension { #name : #EpClassRemoval }

{ #category : #'*GToolkit4Epicea' }
EpClassRemoval >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self classRemoved = other classRemoved ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpClassRemoval >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self classRemoved hash)
]

{ #category : #'*GToolkit4Epicea' }
EpClassRemoval >> isEpClassRemoval [

	^ true.
]
