Class {
	#name : #GtEpiceaRevertAction,
	#superclass : #GtEpiceaAction,
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #accessing }
GtEpiceaRevertAction >> treatEvents: aCollectionOfEvents [

	^ aCollectionOfEvents flatCollect: [ :each | 
		  each asRevertedCodeChange previewedApplyEvents ]
]
