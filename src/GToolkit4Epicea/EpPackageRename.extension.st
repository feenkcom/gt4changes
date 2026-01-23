Extension { #name : #EpPackageRename }

{ #category : #'*GToolkit4Epicea' }
EpPackageRename >> = other [
	^ super = other and: [ self oldPackageName = other oldPackageName ]
]

{ #category : #'*GToolkit4Epicea' }
EpPackageRename >> hash [
	^ super hash bitXor: self oldPackageName hash
]
