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
