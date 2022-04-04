Extension { #name : #EpBehaviorChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorChange >> affectedMarker [
	^ { self class . self behaviorAffectedName }
]
