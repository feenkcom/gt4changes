Extension { #name : #EpMethodChange }

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> affectedMarker [
	^ {  self behaviorAffectedName . self methodAffectedSelector }
]
