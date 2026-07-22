Class {
	#name : #GtEpMethodDefinitionTheSameReason,
	#superclass : #GtEpMethodDefinitionDiffersReason,
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpMethodDefinitionTheSameReason >> explanation [

	^ 'Superseeded as the method definition is the same as the running image'
]

{ #category : #accessing }
GtEpMethodDefinitionTheSameReason >> kind [

	^ #methodDefinitionTheSame
]
