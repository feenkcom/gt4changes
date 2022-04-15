Extension { #name : #EpClassAddition }

{ #category : #'*GToolkit4Epicea' }
EpClassAddition >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self classAdded = other classAdded ] ]
]
