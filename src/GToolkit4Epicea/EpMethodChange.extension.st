Extension { #name : #EpMethodChange }

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self methodAffected = other methodAffected ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> affectedMarker [
	^ {  self behaviorAffectedName . self methodAffectedSelector }
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> gtAffectedPackageName [ 
	^ self methodAffected package 
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self methodAffected hash)
]
