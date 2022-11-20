Extension { #name : #EpTraitChange }

{ #category : #'*GToolkit4Epicea' }
EpTraitChange >> affectedMarker [
	"All trait changes should be grouped together"

	^ { EpTraitChange. self behaviorAffectedName }
]
