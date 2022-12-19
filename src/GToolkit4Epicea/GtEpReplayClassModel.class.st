Class {
	#name : #GtEpReplayClassModel,
	#superclass : #GtEpReplayBehaviorModel,
	#instVars : [
		'superclassName'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #adding }
GtEpReplayClassModel >> addBehaviorChange: anOmEntry [

	super addBehaviorChange: anOmEntry.
	superclassName := anOmEntry content behaviorAffected superclassName.
]

{ #category : #adding }
GtEpReplayClassModel >> addBehaviorRename: anOmEntry [

	super addBehaviorRename: anOmEntry.
	superclassName := anOmEntry content behaviorAffected superclassName.
]

{ #category : #testing }
GtEpReplayClassModel >> definesBehaviorInImage: aGtEpReplayImageModel [
	"Answer a boolean indicating whether the receiver defines its class / trait.
	I.e. are there entries which add the behavior."

	^ entries reversed
		detect: [ :entry | entry content isEpClassAddition or: [ entry content isEpClassModification ] ]
		ifFound: [ :entry | | superclassSymbol |
			superclassSymbol := entry content behaviorAffected superclassName asSymbol.
			"The definition actually defines only if the superclass is defined"
			aGtEpReplayImageModel
				behaviorAt: superclassSymbol
				ifPresent: [ :superclass | superclass definesBehaviorInImage: aGtEpReplayImageModel ]
				ifAbsent: [ self environment includesKey: superclassSymbol ] ]
		ifNone: [ self environment includesKey: self behaviorAffectedName asSymbol. ]
]

{ #category : #testing }
GtEpReplayClassModel >> hasDependentClassIn: anEnvironment [
	"Answer a boolean indicating whether the receiver has any dependent classes present in the supplied environment.
	For a class this means the superclass is present.
	Traits have no equivalent dependency."

	^ anEnvironment includesKey: superclassName asSymbol
]

{ #category : #testing }
GtEpReplayClassModel >> isClass [ 

	^ true
]

{ #category : #accessing }
GtEpReplayClassModel >> superclassName [

	^ superclassName
]
