Class {
	#name : #GtEpDependentCheckExportVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'image'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #private }
GtEpDependentCheckExportVisitor >> checkClassName: aSymbol model: aGtEpReplayModel exception: aGtEpEventSequencerError [
	"Check that the class aSymbol exists, or existed, in the current environment and model image.
	Ideally we should be checking that it existed at the required time (using the sortOrder), but that is not yet implemented."

	((self environment classOrTraitNamed: aSymbol) isNil and: 
		[ image classOrTraitSometimeNamed: aSymbol
			ifPresent: [ :classModel | classModel existed not ]
			ifAbsent: [ true ] ]) ifTrue:
				[ aGtEpEventSequencerError signalModel: aGtEpReplayModel ]
]

{ #category : #accessing }
GtEpDependentCheckExportVisitor >> environment [

	^ self class environment
]

{ #category : #accessing }
GtEpDependentCheckExportVisitor >> image [
	^ image
]

{ #category : #accessing }
GtEpDependentCheckExportVisitor >> image: anObject [
	image := anObject
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitBehaviorChange: aChange [
	^ self checkClassName: aChange behaviorAffectedName
			model: aChange behaviorAffected
			exception: GtEpMissingClassError
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitBehaviorNameChange: aChange [
	"Behavior name changes are always included in the sequence as we don't know the initial state of the image."
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitClassChange: aChange [
	
	"self checkClassName: aChange behaviorAffectedName
			model: aChange behaviorAffected
			exception: GtEpMissingClassError."
	self checkClassName: aChange behaviorAffected superclassName
			model: aChange behaviorAffected
			exception: GtEpInvalidSuperclassError.
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitClassRemoval: aChange [
	"Don't check class removal on export"
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitEvent: aChange [
	"No dependents"
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitMethodChange: aChange [
	
	^ self checkClassName: (GtEpReplayModel classNameAndMeta: aChange behaviorAffectedName) first
			model: aChange behaviorAffected
			exception: GtEpMissingClassError
]

{ #category : #visitor }
GtEpDependentCheckExportVisitor >> visitTraitRemoval: aChange [
	"Trait removal is always included in exports as we don't know the initial state of the image"
]
