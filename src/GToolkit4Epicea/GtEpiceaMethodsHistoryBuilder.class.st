Class {
	#name : #GtEpiceaMethodsHistoryBuilder,
	#superclass : #GtEpiceaHistoryBuilder,
	#instVars : [
		'methodHistoryTypeName'
	],
	#category : 'GToolkit4Epicea-History'
}

{ #category : #actions }
GtEpiceaMethodsHistoryBuilder >> buildHistory [
	^ GtEpiceaMethodHistoriesGroup withAll: (self entriesGroup 
		methodChangesGroupedByAffectedMethod associations 
			collect: [ :assoc | self methodHistoryType  
				forMethod: assoc key
				withChanges: assoc value ])
]

{ #category : #accessing }
GtEpiceaMethodsHistoryBuilder >> methodHistoryType [
	^ self methodHistoryTypeName
		ifNil: [ GtEpiceaMethodHistory ] 
		ifNotNil: [ :aClassName |
			self class environment at:  aClassName ]
]

{ #category : #accessing }
GtEpiceaMethodsHistoryBuilder >> methodHistoryTypeName [

	^ methodHistoryTypeName
]

{ #category : #accessing }
GtEpiceaMethodsHistoryBuilder >> methodHistoryTypeName: aTypeName [

	methodHistoryTypeName := aTypeName
]
