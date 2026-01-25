Extension { #name : #EpPackageChange }

{ #category : #'*GToolkit4Epicea' }
EpPackageChange >> = other [
	^ self species = other species and: [ self packageName = other packageName ]
]

{ #category : #'*GToolkit4Epicea' }
EpPackageChange >> hash [
	^ self species hash bitXor: self packageName hash
]
