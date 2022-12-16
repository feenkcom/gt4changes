Extension { #name : #EpBehaviorCommentChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorCommentChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self oldComment = other oldComment and: [ 
				self newComment = other newComment ] ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorCommentChange >> initializeWithBehavior: aBehavior oldComment: anOldComment newComment: aNewComment oldStamp: anOldStamp newStamp: aNewStamp [

	(newComment = 'nil' or: [ oldComment = 'nil' ]) ifTrue:
		[ self error: 'This error is probably appearing due to a bug causing the comment to be set to the string ''nil''.' ].
	self initialize.
	behavior := aBehavior.
	oldComment := anOldComment.
	newComment := aNewComment.
	oldStamp := anOldStamp.
	newStamp := aNewStamp.
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorCommentChange >> isEpBehaviorCommentChange [

	^ true
]
