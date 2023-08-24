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
	| currentSubclasses|
	currentSubclasses := self subclasses.
	
	super addBehaviorRename: anOmEntry.
	superclassName := anOmEntry content behaviorAffected superclassName.
	
	currentSubclasses do: [ :aSubclass |
		aSubclass updateSuperclassNameTo: self name ]
]

{ #category : #adding }
GtEpReplayClassModel >> addCategoryChange: anOmEntry [

	super addCategoryChange: anOmEntry.
	superclassName := anOmEntry content behaviorAffected superclassName.
]

{ #category : #testing }
GtEpReplayClassModel >> definesBehaviorInImage: aGtEpReplayImageModel [
	"Answer a boolean indicating whether the receiver defines its class / trait.
	I.e. are there entries which add the behavior."

	^ entries reversed
		detect: [ :entry | entry content isEpClassAddition or: [ entry content isEpClassModification ] ]
		ifFound: [ :entry |
			"The definition actually defines only if the superclass is defined"
			aGtEpReplayImageModel includesBehaviorSometimeNamed: entry content behaviorAffected superclassName asSymbol ]
		ifNone: [ self environment includesKey: self behaviorAffectedName asSymbol. ]
]

{ #category : #testing }
GtEpReplayClassModel >> hasDependentClassIn: anEnvironment [
	"Answer a boolean indicating whether the receiver has any dependent classes present in the supplied environment.
	For a class this means the superclass is present (possibly with a previous name).
	Traits have no equivalent dependency."

	^ imageModel includesBehaviorSometimeNamed: superclassName asSymbol
]

{ #category : #testing }
GtEpReplayClassModel >> hasSubclasses [

	^ self subclasses isNotEmpty
]

{ #category : #testing }
GtEpReplayClassModel >> isClass [ 

	^ true
]

{ #category : #testing }
GtEpReplayClassModel >> knowsSuperclassInModel [

	^ superclassName notNil and: [
		imageModel basicIncludesBehaviorSometimeNamed:  superclassName ]
]

{ #category : #accessing }
GtEpReplayClassModel >> subclasses [
	| subclasses |

	subclasses := imageModel subclassesFor: self.
	self currentDefinition ifNotNil: 
		[ :cls | subclasses := subclasses, cls subclasses ].
	^ subclasses
]

{ #category : #accessing }
GtEpReplayClassModel >> superclassName [

	^ superclassName ifNil: [ 
		self asRingDefinition ifNotNil: [ :aClassDefinition | 
			aClassDefinition superclassName ] ]
]

{ #category : #accessing }
GtEpReplayClassModel >> updateSuperclassNameTo: aNewSuperclassName [
	superclassName := aNewSuperclassName
]
