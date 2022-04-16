Extension { #name : #EpClassModification }

{ #category : #'*GToolkit4Epicea' }
EpClassModification >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldClass = other oldClass and: [ 
				self newClass = other newClass ] ] ]
]
