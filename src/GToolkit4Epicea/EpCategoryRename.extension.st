Extension { #name : #EpCategoryRename }

{ #category : #'*GToolkit4Epicea' }
EpCategoryRename >> = other [

	super = other and: [ 
		self oldCategoryName = other oldCategoryName and: [ 
			self newCategoryName = other newCategoryName ] ]
]
