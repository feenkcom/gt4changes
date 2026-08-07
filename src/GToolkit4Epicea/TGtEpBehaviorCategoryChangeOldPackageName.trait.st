Trait {
	#name : #TGtEpBehaviorCategoryChangeOldPackageName,
	#instVars : [
		'oldPackageName'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #utils }
TGtEpBehaviorCategoryChangeOldPackageName >> inferOldPackageNameFromOldCategoryName [
	self packageOrganizer packages 
		detect: [ :each | 
			self packageOrganizer
				category: self oldCategory 
				matches: each packageName ]
		ifFound: [ :aPackage | 
			self oldPackageName: aPackage name asString ]
]

{ #category : #accessing }
TGtEpBehaviorCategoryChangeOldPackageName >> oldPackageName [

	^ oldPackageName
]

{ #category : #accessing }
TGtEpBehaviorCategoryChangeOldPackageName >> oldPackageName: aPackageName [

	oldPackageName := aPackageName
]
