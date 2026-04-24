Class {
	#name : #GtEpImageModelReplayVisitor,
	#superclass : #GtEpImageModelExportVisitor,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #private }
GtEpImageModelReplayVisitor >> addBehaviorEntriesFrom: aGtEpReplayBehaviorModel [
	"For replay in the current image, if the first entry matches the image it isn't required."
	| entry |

	super addBehaviorEntriesFrom: aGtEpReplayBehaviorModel.
	aGtEpReplayBehaviorModel entries ifEmpty: [ ^ self ].
	entry := aGtEpReplayBehaviorModel entries first.
	"Note that this test is not reliable as it depends on the behaviour definition string, which can be in multiple forms (old vs. shift), in which case the entry will be left in unncessarily."
	(entry content accept: (EpHasImpactVisitor inEnvironment: self environment)) ifFalse:
		[ entry classification: #superseeded reason: (GtEpHasNoImpactReason
			requiredEntry: entry
			model: aGtEpReplayBehaviorModel) ].
]

{ #category : #'as yet unclassified' }
GtEpImageModelReplayVisitor >> assertDependencies [

	wrappedEntries 
		detect: [ :aGtEpSequencerEntry | aGtEpSequencerEntry isMissingDependency ]
		ifFound: [ :aGtEpSequencerEntry |
			GtEpMissingClassError signalEntry: aGtEpSequencerEntry ]
]

{ #category : #private }
GtEpImageModelReplayVisitor >> checkDependencies [

	GtEpDependentsCheckVisitor visitNodes: wrappedEntries
]

{ #category : #private }
GtEpImageModelReplayVisitor >> modelWithPreviousNamesOrEnvironmentIncludesBehaviorNamed: aSymbol [
	"Answer a boolean indicating whether the named behaviour exists in the system or model,
	including as an earlier name of any behaviour.
	Previous lives are not considered."

	^ (self environment classOrTraitNamed: aSymbol) isNotNil or:
		[ image includesBehaviorSometimeNamed: aSymbol ]
]

{ #category : #private }
GtEpImageModelReplayVisitor >> postProcessWrappedEntries [
	| chains |
	
	self superseedNoImpactMethodDefinitions.
	super postProcessWrappedEntries.
	chains := self classChains.
	self superseedFinalDefinitionMatchesFrom: chains.
	self superseedNoImpactRenamesAndRemovesFrom: chains.
	self checkDependencies.
]

{ #category : #testing }
GtEpImageModelReplayVisitor >> shouldAddMethod: aGtEpReplayMethodModel [
	"Removals are always included.  Method definitions are included if it doesn't match the current definition."
	| currentClassName selector |

	currentClassName := currentBehaviorModel name.
	selector := aGtEpReplayMethodModel selector.
	(self environment classOrTraitNamed: currentClassName) ifNotNil: [ :classOrTrait |
		classOrTrait methodDict at: selector
			ifPresent: [ :method |
				^ (method sourceCode ~= aGtEpReplayMethodModel sourceCode or:
					[ method protocol name ~= aGtEpReplayMethodModel protocol ])
						ifTrue: [ GtEpMethodDefinitionDiffersReason 
							entry: aGtEpReplayMethodModel entries last
							image: image ]
						ifFalse: [ nil ] ] ].
	^ GtEpLegacySequencerEntryReason 
		kind: #addMethodByDefault
		entry: aGtEpReplayMethodModel entries last
]

{ #category : #testing }
GtEpImageModelReplayVisitor >> shouldReplayCommentEntry: latestCommentEntry [
	| event |

	event := latestCommentEntry content.
	^ (self environment classOrTraitNamed: event behaviorAffectedName)
		ifNil: [ image includesBehaviorSometimeNamed: event behaviorAffectedName ]
		ifNotNil: [ :cls | cls comment ~= event newComment ].
]

{ #category : #private }
GtEpImageModelReplayVisitor >> superseedFinalDefinitionMatchesFrom: chains [
	"Mark as superseeded any chains where the final definition matches the current definition."

	chains do: [ :chain |
		(GtEpReplayModel isBehaviorDefinitionCurrent: chain last content behaviorAffected) ifTrue:
			[ chain do: [ :entry |
				entry classification: #superseeded reason:
					(GtEpBehaviorDefinitionMatchesReason matchingEntry: chain last) ] ] ].
]

{ #category : #private }
GtEpImageModelReplayVisitor >> superseedNoImpactMethodDefinitions [
	"Remove EpMethodChanges that have no impact, i.e. any of the follow are true:
	- the class never existed.
	- the change is a removal and the method is already gone.
	- the change is not a removal and the change matches the current definition."

	wrappedEntries do: [ :entry | | event |
		event := entry content.
		event isEpMethodChange ifTrue:
			[ | reason |
			(self modelWithPreviousNamesOrEnvironmentIncludesBehaviorNamed: event behaviorAffectedName) not ifTrue:
				[ reason := GtEpMethodsClassDoesntExistReason entry: entry ].
			reason ifNil:
				[ | realClass |
					realClass := self environment classOrTraitNamed: event behaviorAffectedName.
					(event isEpMethodRemoval and: [ realClass isNil or: [ (realClass methodDict includesKey: event selector) not ] ]) ifTrue:
						[ reason := GtEpMethodDoesntExistReason entry: entry ]
					ifFalse:
						[ event isEpMethodRemoval not and: 
							[ realClass isNotNil and: 
								[ realClass compiledMethodAt: event selector
									ifPresent: [ :compiledMethod |
										(compiledMethod protocol name = event protocol and:
											[ compiledMethod sourceCode = event sourceCode ]) ifTrue:
												[ reason := GtEpMethodDefinitionTheSameReason 
														entry: entry
														image: image ] ] ] ] ] ].
			reason ifNotNil:
				[ entry classification: #superseeded reason: reason ] ] ].
]

{ #category : #'as yet unclassified' }
GtEpImageModelReplayVisitor >> superseedNoImpactRenamesAndRemovesFrom: chains [
	"Remove EpBehaviorNameChange and EpClassRemoval events that have no impact in the current image.
Iterate over each chain marking rename and remove events up until the time the class/trait is known to exist."

	chains do: [ :chain | | classExists removalEntry |
		classExists := false.
		removalEntry := (GtEpReplayModel isBehaviorRemoval: chain last content) ifTrue:
			[ chain last ]
		ifFalse:
			[ nil ].
		chain do: [ :entry |
			classExists ifFalse:
				[ | event |
				event := entry content.
				event isEpBehaviorNameChange ifTrue: 
					[ "Name changes are considered to exist if they:
					- exist in the system with the old name, or
					- exist in the model (either current or previous name)."
					classExists := self modelWithPreviousNamesOrEnvironmentIncludesBehaviorNamed: event oldName.
					classExists ifFalse:
						[ entry classification: #superseeded reason: (removalEntry
							ifNil: [ GtEpBehaviorDoesntExistReason 
								behaviorName: event behaviorAffectedName
								supersededEntry: entry]
							ifNotNil: [ GtEpBehaviorRemovedReason
								behaviorName: event behaviorAffectedName
								removalEntry: removalEntry
								supersededEntry: entry ]) ] ]
				ifFalse: [ (event isEpClassRemoval or: [ event isEpTraitRemoval ]) ifTrue:
					[ "Behaviours are considered to exist if they exist in the system."
					classExists := (self environment classOrTraitNamed: event behaviorAffectedName) isNotNil.
					classExists ifFalse:
						[ entry classification: #superseeded reason: (GtEpBehaviorDoesntExistReason 
							behaviorName: event behaviorAffectedName
							supersededEntry: entry) ] ]
				ifFalse: 
					[ (event isEpClassChange or: [ event isEpTraitChange ]) ifTrue:
						[ classExists := entry isRequired. ] ] ] ] ] ].
]
