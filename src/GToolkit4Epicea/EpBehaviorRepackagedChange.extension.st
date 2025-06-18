Extension { #name : #EpBehaviorRepackagedChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorRepackagedChange >> isEpBehaviorRepackagedChange [
	^ true
]

{ #category : #'*GToolkit4Epicea' }
EpBehaviorRepackagedChange >> newCategory [
	^ self newTagName 
		ifNil: [ self newPackageName ]
		ifNotNil: [ :aTagName |
			(aTagName = RPackage rootTagName)
				ifTrue: [ self newPackageName ]
				ifFalse: [ self newPackageName, '-', aTagName ] ]
]
