Class {
	#name : #GtEpiceaRevertAction,
	#superclass : #GtEpiceaAction,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaRevertAction >> treatEvents: aCollectionOfEvents [

	^ aCollectionOfEvents flatCollect: [ :each | 
		  each asRevertedCodeChange previewedApplyEvents ]
]
