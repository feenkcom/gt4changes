Class {
	#name : #GtEpiceaMethodsHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #actions }
GtEpiceaMethodsHistoryBuilder >> buildHistory [
	^ GtEpiceaMethodHistoriesGroup withAll: (self entriesGroup 
		methodChangesGroupedByAffectedMethod associations 
			collect: [ :assoc | GtEpiceaMethodHistory  
				forMethod: assoc key
				withChanges: assoc value ])
]
