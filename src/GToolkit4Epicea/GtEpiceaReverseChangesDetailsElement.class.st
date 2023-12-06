Class {
	#name : #GtEpiceaReverseChangesDetailsElement,
	#superclass : #GtEpiceaAbstractChangesDetailsElement,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaReverseChangesDetailsElement >> entries: aListOfChanges [
	^super entries: (aListOfChanges
				collect: [:entry | entry copy content: entry content asRevertedCodeChange])
]
