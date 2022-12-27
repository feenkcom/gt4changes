Extension { #name : #EpCategoryChange }

{ #category : #'*GToolkit4Epicea' }
EpCategoryChange >> = other [

	^ self species = other species and: [ 
		self affectedPackageName = other affectedPackageName and: [ 
			self categoryName = other categoryName ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpCategoryChange >> affectedMarker [
	^ self affectedPackageName
]

{ #category : #'*GToolkit4Epicea' }
EpCategoryChange >> hash [
	^ self species hash
		bitXor: (self affectedPackageName hash bitXor: self categoryName hash)
]
