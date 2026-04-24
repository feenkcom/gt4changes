Class {
	#name : #GtEpiceaBranchesHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#category : #'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaBranchesHistoryBuilder >> buildHistory [
	^ GtEpiceaBranchHistoriesGroup withAll: (self entriesGroup 
		changesGroupedByBranch 
			collect: [ :assoc | GtEpiceaBranchHistory 
				forChanges: assoc value ])
]
