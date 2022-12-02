Class {
	#name : #GtEpiceaRevertAction,
	#superclass : #GtEpiceaAction,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaRevertAction >> entries: aCollection [

	entries := aCollection collect: [ :each | each copy content: each content asRevertedCodeChange ]
]
