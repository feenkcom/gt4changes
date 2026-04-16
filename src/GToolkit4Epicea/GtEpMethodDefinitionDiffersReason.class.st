Class {
	#name : #GtEpMethodDefinitionDiffersReason,
	#superclass : #GtEpSequencerEntryReason,
	#instVars : [
		'entry'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpMethodDefinitionDiffersReason class >> entry: anEntry image: aGtEpReplayImageModel [

	^ self new
		entry: anEntry;
		imageModel: aGtEpReplayImageModel
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> behaviorAffectedName [

	^ entry content behaviorAffectedName
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> behaviorModel [

	^ imageModel classOrTraitNamed: self behaviorAffectedName
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> entry [
	^entry
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> entry: anObject [
	entry := anObject
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> explanation [

	^ 'Required as the method definition differs from the running system'
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> kind [
	^ #methodDefinitionDiffers
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> method [
	^ self behaviorModel methodAt: self selector
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> newProtocol [
	^ entry content protocol
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> newSource [
	^ entry content sourceCode
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> relatedEntries [
	^ { entry }
]

{ #category : #accessing }
GtEpMethodDefinitionDiffersReason >> selector [

	^ entry content selector
]
