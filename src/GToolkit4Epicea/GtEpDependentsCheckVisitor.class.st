"
Iterate over the supplied list of epicea events and determine if any are missing dependencies.

Calling this visitor generally only makes sense when about to replay the events in to the current image as it can't be known whether the state of any other image matches the current image.
"
Class {
	#name : #GtEpDependentsCheckVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'behaviors',
		'currentEntry'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #actions }
GtEpDependentsCheckVisitor class >> visitNodes: aCollection [

	^ self new
		visitNodes: aCollection
]

{ #category : #'as yet unclassified' }
GtEpDependentsCheckVisitor >> checkBehaviorNamePresent: aSymbol [

	self
		classOrTraitNamed: aSymbol
		ifPresent: [ :anObject | anObject == #removed ifTrue:
			[ currentEntry classification: #requiredMissingDependency
				reason: #dependencyMarkedRemoved ] ]
		ifAbsent: [ :name |
			(self environment classOrTraitNamed: name) ifNil:
				[ currentEntry classification: #requiredMissingDependency
					reason: #dependencyNotFound ] ]
]

{ #category : #private }
GtEpDependentsCheckVisitor >> classOrTraitNamed: aSymbol ifAbsent: absentBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."

	^ self
		classOrTraitNamed: aSymbol
		ifPresent: [ :entry | entry ]
		ifAbsent: absentBlock
]

{ #category : #private }
GtEpDependentsCheckVisitor >> classOrTraitNamed: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| nameAndMeta name |

	nameAndMeta := GtEpReplayImageModel classNameAndMeta: aSymbol.
	name := nameAndMeta first.
	^ behaviors at: name
		ifPresent: [ :anEntry | presentBlock cull: anEntry ]
		ifAbsent: [ ^ absentBlock cull: name ].
]

{ #category : #private }
GtEpDependentsCheckVisitor >> classOrTraitNamed: aSymbol ifPresent: presentBlock ifAbsentPut: absentBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."

	self
		classOrTraitNamed: aSymbol
		ifPresent: presentBlock
		ifAbsent: 
			[ | name |
			name := (GtEpReplayImageModel classNameAndMeta: aSymbol) first.
			behaviors at: name
				put: (absentBlock cull: name) ].
]

{ #category : #accessing }
GtEpDependentsCheckVisitor >> environment [

	^ self class environment
]

{ #category : #initialization }
GtEpDependentsCheckVisitor >> initialize [

	super initialize.
	behaviors := Dictionary new.
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitBehaviorChange: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	^ self checkBehaviorNamePresent: aChange behaviorAffectedName
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitBehaviorNameChange: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	self checkBehaviorNamePresent: aChange oldName.
	behaviors at: aChange oldName put: #renamed.
	behaviors at: aChange newName put: currentEntry.
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitClassChange: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	self checkBehaviorNamePresent: aChange behaviorAffected superclassName.
	behaviors at: aChange behaviorAffectedName put: currentEntry
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitClassRemoval: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	self checkBehaviorNamePresent: aChange behaviorAffectedName.
	behaviors at: aChange behaviorAffectedName put: #removed.
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitEvent: aChange [
	"No dependents"
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitMethodChange: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	self checkBehaviorNamePresent: aChange behaviorAffectedName.
]

{ #category : #visiting }
GtEpDependentsCheckVisitor >> visitNode: aGtEpSequencerEntry [

	currentEntry := aGtEpSequencerEntry.
	aGtEpSequencerEntry content accept: self.
	currentEntry := nil.
]

{ #category : #visiting }
GtEpDependentsCheckVisitor >> visitNodes: aCollection [
	"Check the dependencies of the supplied entries and mark any required entires that have missing dependencies."
	
	aCollection do: [ :anEntry |
		self visitNode: anEntry ].
	"Iterate over the remaining defined behaviours to ensure that superclass dependencies haven't been removed."
	behaviors values do: [ :anEntry |
		(anEntry isSymbol not and: [ GtEpReplayModel isBehaviorDefinition: anEntry content ]) ifTrue:
			[ self visitNode: anEntry ] ].
]

{ #category : #visitor }
GtEpDependentsCheckVisitor >> visitTraitRemoval: aChange [

	currentEntry isRequired ifFalse: [ ^ self ].
	self checkBehaviorNamePresent: aChange behaviorAffectedName.
	behaviors at: aChange behaviorAffectedName put: #removed.
]
