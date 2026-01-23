Extension { #name : #EpPackageTagChange }

{ #category : #'*GToolkit4Epicea' }
EpPackageTagChange >> = other [

	^ self species = other species and: [ 
		self packageName = other packageName and: [ 
			self tagName = other tagName ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpPackageTagChange >> hash [
	^ self species hash bitXor: (self packageName hash bitXor: self tagName hash)
]
