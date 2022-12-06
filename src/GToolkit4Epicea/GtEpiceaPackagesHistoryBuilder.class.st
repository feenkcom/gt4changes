Class {
	#name : #GtEpiceaPackagesHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #adding }
GtEpiceaPackagesHistoryBuilder >> addCodeEntityChange: anOmbuEntry toGroups: aDictionary [
	| packageGroup |
	
	packageGroup := aDictionary 
		at: (anOmbuEntry content gtAffectedPackageName) 
		ifAbsentPut: [ GtEpiceaEntriesGroup new ].
		
	packageGroup add: anOmbuEntry
]

{ #category : #actions }
GtEpiceaPackagesHistoryBuilder >> buildHistory [
	| packagesHistory |
	packagesHistory := GtEpiceaPackageHistoriesGroup new.
	
	self groupedByPackageName associations do: [ :assoc |
		packagesHistory add: (GtEpiceaPackageHistory new
			targetPackageName: assoc key;
			addClassHistories: assoc value classHistories) ].
	
	^ packagesHistory
]

{ #category : #accessing }
GtEpiceaPackagesHistoryBuilder >> groupedByPackageName [
	| groupedByPackageName |
	groupedByPackageName := Dictionary new.
	
	self entriesGroup do: [ :anOmbuEntry |
		(anOmbuEntry content isEpBehaviorChange or: [
			anOmbuEntry content isEpMethodChange ]) ifTrue: [
				self 
					addCodeEntityChange: anOmbuEntry 
					toGroups: groupedByPackageName ] ] .
	
	^ groupedByPackageName
]
