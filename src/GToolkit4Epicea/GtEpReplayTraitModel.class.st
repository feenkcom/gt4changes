Class {
	#name : #GtEpReplayTraitModel,
	#superclass : #GtEpReplayBehaviorModel,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpReplayTraitModel class >> fromClassModel: aGtEpReplayClassModel [
	"Answer the supplied behavior model converted to a trait model"

	^ self new fromClassModel: aGtEpReplayClassModel.
]

{ #category : #adding }
GtEpReplayTraitModel >> addTraitRemoval: anOmEntry [

	self addBehaviorRemoval: anOmEntry.
]

{ #category : #testing }
GtEpReplayTraitModel >> definesBehaviorInImage: aGtEpReplayImageModel [
	"Answer a boolean indicating whether the receiver defines its class / trait.
	I.e. are there entries which add the behavior."

	^ entries
		detect: [ :entry | entry content isEpTraitAddition or: [ entry content isEpTraitModification ] ]
		ifFound: [ :entry | true ]
		ifNone: [ false ]
]

{ #category : #'instance creation' }
GtEpReplayTraitModel >> fromClassModel: aGtEpReplayClassModel [

	name := aGtEpReplayClassModel name.
	classSide := aGtEpReplayClassModel classSide.
	comments := aGtEpReplayClassModel comments.
	previousLives := aGtEpReplayClassModel previousLives.
	previousNames := aGtEpReplayClassModel previousNames.
	aGtEpReplayClassModel becomeForward: self.
]

{ #category : #testing }
GtEpReplayTraitModel >> hasDependentClassIn: anEnvironment [
	"Answer a boolean indicating whether the receiver has any dependent classes present in the supplied environment.
	For a class this means the superclass is present.
	Traits have no equivalent dependency."

	^ true
]

{ #category : #testing }
GtEpReplayTraitModel >> isTrait [

	^ true
]
