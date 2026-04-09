Class {
	#name : #GtEpiceaClassesHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#instVars : [
		'classHistoryTypeName'
	],
	#category : 'GToolkit4Epicea-History'
}

{ #category : #actions }
GtEpiceaClassesHistoryBuilder >> addMethodsHistory: aMethodHistory toGrouping: byClassNameGroups [
	| targetClassName classHistory |
	targetClassName := aMethodHistory targetClassName.

	(self forPharo12AndNewer: [ aMethodHistory targetMethod isMeta ] forPharo11: [ aMethodHistory targetMethod isMetaSide ])
		ifTrue: [ (targetClassName endsWith: ' class')
				ifTrue: [ targetClassName := targetClassName withoutSuffix: ' class' ].
			(targetClassName endsWith: ' classTrait')
				ifTrue: [ targetClassName := targetClassName withoutSuffix: ' classTrait' ] ].

	classHistory := byClassNameGroups
			at: targetClassName
			ifAbsentPut: [ self classHistoryType new targetClassName: targetClassName ].

	classHistory addMethodHistory: aMethodHistory
]

{ #category : #actions }
GtEpiceaClassesHistoryBuilder >> buildHistory [
	| classHistories groupedByClassName |
	groupedByClassName := Dictionary new.
	
	classHistories := self classHistoriesWithOnlyBehaviourChanges.
	classHistories do: [ :aClassHistory |
		groupedByClassName at: aClassHistory targetClassName put: aClassHistory ].
	
	self buildMethodHistories do: [ :aMethodHistory |
		self 
			addMethodsHistory: aMethodHistory 
			toGrouping: groupedByClassName ].
		
	^ GtEpiceaClassHistoriesGroup withAll: groupedByClassName values
]

{ #category : #actions }
GtEpiceaClassesHistoryBuilder >> buildMethodHistories [
	^ (GtEpiceaMethodsHistoryBuilder
		forEntriesGroup: self entriesGroup) 
			methodHistoryTypeName: self classHistoryType methodHistoryType name;
			buildHistory
]

{ #category : #accessing }
GtEpiceaClassesHistoryBuilder >> classHistoriesWithOnlyBehaviourChanges [
	| classHistoryType |
	classHistoryType := self classHistoryType.
	
	^ GtEpiceaClassHistoriesGroup 
		withAll: (self entriesGroup behaviorChangesGroupedByClass associations 
			collect: [ :assoc | 
				classHistoryType  
					forClass: assoc key
					withBehaviourChanges: assoc value ])
]

{ #category : #accessing }
GtEpiceaClassesHistoryBuilder >> classHistoryType [
	^ self classHistoryTypeName
		ifNil: [ GtEpiceaClassHistory ] 
		ifNotNil: [ :aClassName |
			self class environment at:  aClassName ]
]

{ #category : #accessing }
GtEpiceaClassesHistoryBuilder >> classHistoryTypeName [

	^ classHistoryTypeName
]

{ #category : #accessing }
GtEpiceaClassesHistoryBuilder >> classHistoryTypeName: anObject [

	classHistoryTypeName := anObject
]
