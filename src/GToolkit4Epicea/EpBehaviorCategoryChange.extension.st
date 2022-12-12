Extension { #name : #EpBehaviorCategoryChange }

{ #category : #'*GToolkit4Epicea' }
EpBehaviorCategoryChange >> initializeOldCategory: anOldCategory newCategory: aNewCategory class: aClass [

	self initialize.
	oldCategory := anOldCategory.
	newCategory := aNewCategory.
	class := aClass asEpiceaRingDefinition.
	
	"This is a hack-ish was to determine the name of the old package starting from the name of the old category."
	self inferOldPackageNameFromOldCategoryName.
]
