Extension { #name : #EpClassChange }

{ #category : #'*GToolkit4Epicea' }
EpClassChange >> affectedMarker [
	"All class changes should be grouped together"

	^ { EpClassChange. self behaviorAffectedName }
]
