Extension { #name : #EpClassRemoval }

{ #category : #'*GToolkit4Epicea' }
EpClassRemoval >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self classRemoved = other classRemoved ] ]
]
