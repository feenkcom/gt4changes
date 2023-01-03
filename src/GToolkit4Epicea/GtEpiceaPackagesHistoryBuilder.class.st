Class {
	#name : #GtEpiceaPackagesHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#category : #'GToolkit4Epicea-History'
}

{ #category : #'accessing - grouping' }
GtEpiceaPackagesHistoryBuilder >> addChangeFor: anOmbuEntry toGroups: groupedByPackageName [ 
	(anOmbuEntry content isEpBehaviorChange or: [
		anOmbuEntry content isEpMethodChange ]) ifTrue: [
			self 
				addCodeEntityChange: anOmbuEntry 
				toPackageNamed: anOmbuEntry content gtAffectedPackageName
				inGroups: groupedByPackageName ]
]

{ #category : #adding }
GtEpiceaPackagesHistoryBuilder >> addCodeEntityChange: anOmbuEntry toPackageNamed: aPackageName inGroups: aDictionary [
	| packageGroup |
	
	packageGroup := aDictionary 
		at: aPackageName 
		ifAbsentPut: [ GtEpiceaEntriesGroup new ].
	
	packageGroup add: anOmbuEntry
]

{ #category : #'accessing - grouping' }
GtEpiceaPackagesHistoryBuilder >> addExtraEventForCategoryChangeFor: anOmbuEntry toGroups: groupedByPackageName [ 
	anOmbuEntry content class = EpBehaviorCategoryChange ifFalse: [ ^ self ].
	anOmbuEntry content oldPackageName ifNil: [ ^ self ].
	
	self 
		addCodeEntityChange: anOmbuEntry
		toPackageNamed: anOmbuEntry content oldPackageName
		inGroups: groupedByPackageName
]

{ #category : #'accessing - grouping' }
GtEpiceaPackagesHistoryBuilder >> addExtraEventForExtensionMethodFor: anOmbuEntry toGroups: groupedByPackageName [ 
	| event previousPackageName|
	event := anOmbuEntry content.
	event class = EpMethodModification ifFalse: [ ^ self ].
	
	"We add an extra event in case the protocol of an extension method is involved"
	event gtIsProtocolChangeForExtensionMethod ifFalse: [ ^ self ].
	
	previousPackageName := event gtPreviousPackageName.
	previousPackageName ifNil: [ ^ self ].
	
	self 
		addCodeEntityChange: anOmbuEntry
		toPackageNamed: previousPackageName
		inGroups: groupedByPackageName
]

{ #category : #actions }
GtEpiceaPackagesHistoryBuilder >> buildClassesHistoriesFor: aCollectionOfEntries forPackageNamed: aPackageName [
	| histories |
	
	histories := (GtEpiceaClassesHistoryBuilder forEntriesGroup: aCollectionOfEntries)
		classHistoryTypeName: GtEpiceaClassInPackageHistory name;
		buildHistory.
		
	histories do: [ :aClassHistory |
		aClassHistory targetPackageName: aPackageName ].
		
	^ histories
]

{ #category : #actions }
GtEpiceaPackagesHistoryBuilder >> buildHistory [
	| packagesHistory |
	packagesHistory := GtEpiceaPackageHistoriesGroup new.
	
	self groupedByPackageName associations do: [ :assoc |
		packagesHistory add: (self 
			createHistoryForPackageNamed: assoc key
			fromChanges: assoc value) ].
	
	^ packagesHistory
]

{ #category : #actions }
GtEpiceaPackagesHistoryBuilder >> createHistoryForPackageNamed: aPackageName fromChanges: aListOfChanges [ 
	^ GtEpiceaPackageHistory new
		targetPackageName: aPackageName;
		addClassHistories: (self 
			buildClassesHistoriesFor: aListOfChanges
			forPackageNamed: aPackageName)
]

{ #category : #'accessing - grouping' }
GtEpiceaPackagesHistoryBuilder >> groupedByPackageName [
	| groupedByPackageName |
	groupedByPackageName := Dictionary new.
	
	self entriesGroup do: [ :anOmbuEntry |
		self 
			addChangeFor: anOmbuEntry
			toGroups: groupedByPackageName.
		self 
			addExtraEventForCategoryChangeFor: anOmbuEntry 
			toGroups: groupedByPackageName.
		self 
			addExtraEventForExtensionMethodFor: anOmbuEntry	
			toGroups: groupedByPackageName ].
	
	^ groupedByPackageName
]
