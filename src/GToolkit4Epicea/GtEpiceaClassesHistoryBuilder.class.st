Class {
	#name : #GtEpiceaClassesHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #actions }
GtEpiceaClassesHistoryBuilder >> buildHistory [
	| classHistories groupedByClassName |
	groupedByClassName := Dictionary new.
	
	classHistories := self classHistoriesWithOnlyBehaviourChanges.
	classHistories do: [ :aClassHistory |
		groupedByClassName at: aClassHistory targetClassName put: aClassHistory ].
	
	self entriesGroup methodHistories do: [ :aMethodHistory |
		| targetClassName classHistory | 
		targetClassName := aMethodHistory targetClassName.
		aMethodHistory targetMethod isMetaSide ifTrue: [ 
			targetClassName := targetClassName removeSuffix: ' class' ].
		classHistory := groupedByClassName 
			at: targetClassName
			ifAbsentPut: [
				GtEpiceaClassHistory   new
					targetClassName: targetClassName ].
		classHistory addMethodHistory: aMethodHistory ].
		
	^ GtEpiceaClassHistoriesGroup withAll: groupedByClassName values
]

{ #category : #accessing }
GtEpiceaClassesHistoryBuilder >> classHistoriesWithOnlyBehaviourChanges [
	^ GtEpiceaClassHistoriesGroup 
		withAll: (self entriesGroup behaviorChangesGroupedByClass associations 
			collect: [ :assoc | GtEpiceaClassHistory  
				forClass: assoc key
				withBehaviourChanges: assoc value ])
]
