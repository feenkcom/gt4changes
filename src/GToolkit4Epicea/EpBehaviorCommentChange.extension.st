Extension { #name : #EpBehaviorCommentChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorCommentChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldComment = other oldComment and: [ 
				self newComment = other newComment ] ] ]
]
