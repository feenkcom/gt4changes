Class {
	#name : #GtEpiceaClassHistoriesGroup,
	#superclass : #GtEpiceaEntityHistoriesGroup,
	#category : 'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaClassHistoriesGroup >> methodHistories [
	^ (GtEpiceaMethodHistoriesGroup 
		withAll: (self items 
			flatCollect: [ :aClassHistory | 
				aClassHistory methodHistories ]))
]
