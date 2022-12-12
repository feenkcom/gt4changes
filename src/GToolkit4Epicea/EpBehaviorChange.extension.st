Extension { #name : #EpBehaviorChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorChange >> affectedMarker [
	^ { self class . self behaviorAffectedName }
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorChange >> gtAffectedPackageName [ 
	^ self behaviorAffected package
]
