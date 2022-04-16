Extension { #name : #EpBehaviorNameChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorNameChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldName = other oldName and: [ 
				self newName = other newName ] ] ]
]
