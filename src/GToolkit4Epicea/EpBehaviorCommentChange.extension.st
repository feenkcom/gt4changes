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
		[ Stdio stdout << '*** nil comment warning'; lf.
		GtEpNilCommentSignal emit ].
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
