Trait {
	#name : #TGtEpBehaviorCategoryChangeOldPackageName,
	#instVars : [
		'oldPackageName'
	],
	#category : 'GToolkit4Epicea-Model'
}

{ #category : #utils }
TGtEpBehaviorCategoryChangeOldPackageName >> inferOldPackageNameFromOldCategoryName [
	RPackageOrganizer default packages 
		detect: [ :each | 
			RPackageOrganizer default 
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
