Class {
	#name : #GtEpDependentCheckReplayVisitor,
	#superclass : #GtEpDependentCheckExportVisitor,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visitor }
GtEpDependentCheckReplayVisitor >> visitBehaviorNameChange: aChange [

	self checkClassName: aChange oldName
			model: aChange behaviorAffected
			exception: GtEpMissingClassError.
	self checkClassName: aChange newName
			model: aChange behaviorAffected
			exception: GtEpMissingClassError.
	self checkClassName: aChange behaviorAffected superclassName
			model: aChange behaviorAffected
			exception: GtEpInvalidSuperclassError.
]

{ #category : #visitor }
GtEpDependentCheckReplayVisitor >> visitClassRemoval: aChange [
	^ self visitClassChange: aChange
]
