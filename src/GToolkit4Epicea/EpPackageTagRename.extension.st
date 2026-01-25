Extension { #name : #EpPackageTagRename }

{ #category : #'*GToolkit4Epicea' }
EpPackageTagRename >> = other [
	^ super = other and: [ self oldTagName = other oldTagName ]
]

{ #category : #'*GToolkit4Epicea' }
EpPackageTagRename >> hash [
	^ super hash bitXor: self oldTagName hash
]
