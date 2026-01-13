"
Iterate over the supplied {{gtClass:GtEpReplayImageModel}} and answer the minimum collection of entries required to recover the code state.
"
Class {
	#name : #GtEpImageModelInImageVisitor,
	#superclass : #Object,
	#instVars : [
		'image',
		'stream',
		'sequencedEntries',
		'earliestBehaviorDependency',
		'currentBehaviorModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpImageModelInImageVisitor class >> image: aGtEpReplayImageModel [ 

	^ self new image: aGtEpReplayImageModel
]

{ #category : #sequencing }
GtEpImageModelInImageVisitor class >> sequencedEntriesFrom: aCollectionOfEntries [
	| visitor image replay |

	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: aCollectionOfEntries.
	image := visitor image.
	replay := self image: image.
	^ replay sequencedEntries.
]

{ #category : #private }
GtEpImageModelInImageVisitor >> alwaysIncludeBehaviorEvent: anEpEvent [
	"Answer a boolean indicating if the supplied event should always be included for replay"

	^ anEpEvent isEpBehaviorNameChange 
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> behaviorEntriesChangeRunningSystem: replayEntries [
	"Answer a boolean indicating whether the supplied behavior changes impact the running system."

	^ replayEntries isNotEmpty and:
		[ (currentBehaviorModel hasDependentClassIn: self environment) and:
		[ self currentOrPreviousBehaviorNameExists and:
		[ self behaviorModificationEntryDiffersFromCurrent: replayEntries last ] ] ]
]

{ #category : #private }
GtEpImageModelInImageVisitor >> behaviorHasSubclassesAfter: replayEntry [
	"Answer a boolean indicating whether the supplied behavior entry has subclasses that are modified after the replayEntry"
	| superclass |

	superclass := replayEntry content behaviorAffected.
	^ image behaviors anySatisfy: [ :behavior | 
		behavior inheritedFrom: superclass modifiedAfter: replayEntry gtTime ]

]

{ #category : #testing }
GtEpImageModelInImageVisitor >> behaviorModificationEntryDiffersFromCurrent: anOmEntry [
	"Renames can mean the superclass doesn't match.
	The behavior is considered to be the same if anOmEntry = the current definition or anOmEntry superclass name is a previous name of the current definition."
	| modificationString classModel currentString modificationDefinition currentDefinition |

	modificationString := anOmEntry content behaviorAffected definitionSource.
	modificationDefinition := GtRBAddClassChange new
				definitionString: modificationString;
				fillOutDefinition;
				yourself.

	currentString := (self environment at: anOmEntry content behaviorAffectedName 
			ifPresent: [ :behavior | behavior definitionString ]
			ifAbsent: [ ^ true ]).
	currentDefinition := GtRBAddClassChange new
				definitionString: currentString;
				fillOutDefinition;
				yourself.

	(self definition: modificationDefinition equivalentTo: currentDefinition) ifTrue: [ ^ false ].

	classModel := image classModelNamed: anOmEntry content behaviorAffectedName.
	^ (classModel previousSuperclassNames includes: modificationDefinition superclassName) not.
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> behaviorNameExists: aSymbol [

	^ self class environment includesKey: aSymbol asSymbol.
]

{ #category : #private }
GtEpImageModelInImageVisitor >> canRejectBehaviourChangeFor: aBehaviourModel atIndex: anIndex inEntries: aCollection [ 
	^ aBehaviourModel isClass 
		and: [ aBehaviourModel subclasses isEmpty 
			and: [ aBehaviourModel knowsSuperclassInModel not ] ]  
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> commentEntryChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating if the supplied entry will change the running system.
	Since the class may have been renamed, go back through previous names to find the current definition."
	| behaviorNames missingOriginal index newComment |

	newComment := anOmEntry content newComment ifNil: [ '' ].
	"Don't allow the string 'nil' to be set as the comment"
	newComment = 'nil' ifTrue: [ ^ false ].

	behaviorNames := OrderedCollection new.
	behaviorNames add: currentBehaviorModel behaviorAffectedName asSymbol.
	index := currentBehaviorModel previousNames size.
	missingOriginal := true.
	[ missingOriginal and: [ index > 0 ] ] whileTrue:
		[ | previousName |
		previousName := currentBehaviorModel previousNames at: index.
		behaviorNames add: previousName.
		previousName = anOmEntry content behaviorAffectedName 
			ifTrue: [ missingOriginal := false ]
			ifFalse: [ index := index - 1 ] ].

	behaviorNames do: [ :name |
		(self environment classOrTraitNamed: name) 	ifNotNil: [ :behavior | 
			^ behavior hasComment
				ifTrue: [ newComment ~= behavior comment ]
				ifFalse: [ true ] ] ].

	^ true
]

{ #category : #accessing }
GtEpImageModelInImageVisitor >> currentBehavior [
	"Answer the behavior with the same name as currentBehaviorModel, or nil"

	^ self environment classOrTraitNamed: currentBehaviorModel behaviorAffectedName.
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> currentOrPreviousBehaviorNameExists [
	"Answer a boolean indicating whether the current or one of the previous behaviour's names exists in the current image."

	((currentBehaviorModel definesBehaviorInImage: image) or:
		[ self environment includesKey: currentBehaviorModel behaviorAffectedName ]) ifTrue: [ ^ true ].
	^ currentBehaviorModel previousNames
		detect: [ :name | self environment includesKey: name asSymbol ]
		ifFound: [ :name | true ]
		ifNone: [ false ].
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> definition: definition1 equivalentTo: definition2 [

	^ definition1 changeClassName = definition2 changeClassName and:
		[ definition1 superclassName = definition2 superclassName and:
		[ definition1 classVariableNames asSet = definition2 classVariableNames asSet and:
		[ definition1 instanceVariableNames asSet = definition2 instanceVariableNames asSet and:
		[ definition1 category = definition2 category and:
		[ definition1 package = definition2 package and:
		[ definition1 sharedPoolNames asSet = definition2 sharedPoolNames asSet and:
		[ definition1 packageTagName = definition2 packageTagName ] ] ] ] ] ] ]
]

{ #category : #private }
GtEpImageModelInImageVisitor >> earliestUnplayedRenameIndexIn: entries [
	"Answer the earliest index of any unplayed rename events.
	If none, answer the last index (entries size).
	The may be suboptimal in that it may include events that are not required."

	^ entries
		detect: [ :entry | entry content isEpBehaviorNameChange and:
			[ (self class environment classOrTraitNamed: entry content behaviorAffectedName) isNil ] ]
		ifFound: [ :entry | entries indexOf: entry ]
		ifNone: [ entries size ]
]

{ #category : #accessing }
GtEpImageModelInImageVisitor >> environment [

	^ self class environment
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> eventHasImpact: anEpEvent [

	^ anEpEvent hasImpact
]

{ #category : #private }
GtEpImageModelInImageVisitor >> hasNoRenamesBeforeIndex: anIndex inEntries: aCollection [ 
	"This method checks if there are any renames after the current index.
	We use it in order to not filter behaviour changes if we get renames 
	before in the changes list, as the order can play a role."
	
	^ (aCollection takeFirst: anIndex - 1) allSatisfy: [ :anEntry |
		anEntry content isEpBehaviorNameChange not ]
]

{ #category : #accessing }
GtEpImageModelInImageVisitor >> image [

	^ image
]

{ #category : #accessing }
GtEpImageModelInImageVisitor >> image: aGtEpReplayImageModel [

	image := aGtEpReplayImageModel.
	stream := Array new writeStream.
	self visitNode: image.
	sequencedEntries := stream contents.
	stream := nil.
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> isBehaviorAddition: anEpEvent [
	"Answer a boolean indicating whether the supplied event adds the behavior to the system"

	^ anEpEvent isEpClassAddition or: [ anEpEvent isEpClassModification or:
		[ anEpEvent isEpTraitAddition or: [ anEpEvent isEpTraitModification ] ] ].
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> isBehaviorRemoval: anEpEvent [
	"Answer a boolean indicating whether the supplied event removes the behavior from the system"

	^ anEpEvent isEpClassRemoval or: [ anEpEvent isEpTraitRemoval ].
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> isMethodAddition: anEpMethodChange [
	"Answer a boolean indicating whether the supplied event adds the behavior to the system"

	^ anEpMethodChange isEpMethodAddition or: [ anEpMethodChange isEpMethodModification ]
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> methodEntryChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system.
	If the entry is a removal, the answer is whether the entry has an impact.
	If the behavior exists, it is whether the code has changed.
	If the behavior doesn't exist, it has no impact."
	| event |

	event := anOmEntry content.
	^ event isEpMethodRemoval ifTrue: 
		[ event hasImpact ]
	ifFalse: 
		[ self currentOrPreviousBehaviorNameExists and:
			[ self methodModificationEntryDiffersFromCurrent: anOmEntry ] ]
]

{ #category : #private }
GtEpImageModelInImageVisitor >> methodModificationEntryDiffersFromCurrent: anOmEntry [
	"Determine if the supplied method definition differs from what is currently in the system.  Check back through previous class names to see if the method is inherited through a rename.
	The method's behavior must exist in the system or be defined by the previous entries."

	| isMetaSide behaviorNames missingOriginal index newSource newProtocol |
	"anOmEntry content selector = #buildImageSyncDropdown ifTrue: [ self halt ]."
	isMetaSide := self
		forPharo12AndNewer: [ anOmEntry content methodAffected isMeta ]
		forPharo11: [ anOmEntry content methodAffected isMetaSide ].
	behaviorNames := OrderedCollection new.
	behaviorNames
		add: (isMetaSide
				ifTrue: [ currentBehaviorModel behaviorAffectedName , ' class' ]
				ifFalse: [ currentBehaviorModel behaviorAffectedName ]) asSymbol.
	index := currentBehaviorModel previousNames size.
	missingOriginal := true.
	[ missingOriginal and: [ index > 0 ] ]
		whileTrue: [ | previousName |
			previousName := currentBehaviorModel previousNames at: index.
			isMetaSide ifTrue: [ previousName := previousName , ' class' ].
			behaviorNames add: previousName.
			previousName = anOmEntry content behaviorAffectedName
				ifTrue: [ missingOriginal := false ]
				ifFalse: [ index := index - 1 ] ].

	newSource := anOmEntry content methodAffectedSourceCode.
	newProtocol := anOmEntry content methodAffectedProtocol.
	behaviorNames
		do: [ :name | 
			(self environment classOrTraitNamed: name)
				ifNotNil: [ :behavior | 
					behavior
						compiledMethodAt: anOmEntry content methodAffectedSelector
						ifPresent: [ :method | | protocolName |
							protocolName := method protocol.
							protocolName isSymbol ifFalse:
								[ self assert: protocolName class name = #Protocol.
								protocolName := protocolName name ].
							^ newProtocol ~= protocolName or: [ newSource ~= method sourceCode ] ]
						ifAbsent: [  ] ]
				ifNil: [  ] ].	"If we get here the entry has an effect since this method is only valid if the behavior exists."
	^ true
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> protocolAdditionChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system"

	^ anOmEntry content hasImpact
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> protocolRemovalChangesRunningSystem: anOmEntry [
	"Answer a boolean indicating whether the supplied entry changes the running system"

	^ anOmEntry content hasImpact
]

{ #category : #private }
GtEpImageModelInImageVisitor >> replayBehaviorFrom: aGtEpReplayBehaviorModel entries: entries [
	"Add the minimal set of change entries required.  
	Addition / Modification entries completely define the behavior.
	Behavior change entries depend on an existing definition.
	A full definition must exist before the earliestBehaviorDependency.
	Include an addition / modification before the earliestBehaviorDependency, if required.
	Include the last addition / modification and any subsequent refactoring.
	entries must be supplied in chronological order."
	| replayEntries index missingDefinition dependencyTime currentEntry endIndex |

	entries ifEmpty: [ ^ self ].

	replayEntries := OrderedCollection new.

	"Find the latest behavior definition that is 
	- prior to the earliest dependent entry
	- includes any renames that aren't already performed."
	"First check for renames that haven't been performed."
	index := self earliestUnplayedRenameIndexIn: entries.
	missingDefinition := true.
	dependencyTime := earliestBehaviorDependency gtTime.
	[ missingDefinition and: [ index > 0 ] ] whileTrue:[ 
		currentEntry := entries at: index.
		((self isBehaviorAddition: currentEntry content) and: [ 
			 (self canRejectBehaviourChangeFor: aGtEpReplayBehaviorModel atIndex: index inEntries: entries) 
			 	and: [ currentEntry gtTime < dependencyTime ] ]) 
					ifTrue: [ missingDefinition := false ]
					ifFalse:[ index := index - 1 ] ].

	"If the entry found above matches the system it isn't required."
	((self isBehaviorAddition: currentEntry content) and:
		[ (self behaviorModificationEntryDiffersFromCurrent: currentEntry) not ]) ifTrue:
			[ index := index + 1 ].

	"Add the required entries"
	(index max: 1) to: entries size do: [ :i |
		replayEntries add: (entries at: i) ].

	"Intermedia additions / modifications can be removed.
	Find the last addition / modification."
	endIndex := replayEntries size.
	[ endIndex > 0 and: [ (self isBehaviorAddition: (replayEntries at: endIndex) content) not ] ]
		whileTrue: [ endIndex := endIndex - 1].
	endIndex - 1 to: 2 by: -1 do: [ :i |
		((self isBehaviorAddition: (replayEntries at: i) content) and: [
			self canRejectBehaviourChangeFor: aGtEpReplayBehaviorModel atIndex: i inEntries: entries ]) ifTrue:
			[ replayEntries removeIndex: i ] ].

	"If the changes have no impact on the system no need to add them"
	(self behaviorEntriesChangeRunningSystem: replayEntries) ifFalse: [ ^ self ].

	replayEntries do: [ :each | stream nextPut: each ].
]

{ #category : #private }
GtEpImageModelInImageVisitor >> replayBehaviorRemovalFrom: aGtEpReplayBehaviorModel [
	"Add the requried entries to remove the supplied behavior.
	If the behavior is removed we need renames, changes that may affect subclasses and the final removal, method events can be ignored."

	aGtEpReplayBehaviorModel previousLives do: [ :previousBehavior |
		| entries replayEntries |
		entries := previousBehavior entries.
		replayEntries := OrderedCollection new.
		entries allButLastDo: [ :replayEntry | 
			(self shouldReplayOnBehaviorRemoval: replayEntry) ifTrue:
				[ replayEntries add: replayEntry ] ].
		((self behaviorNameExists: previousBehavior originalBehaviorNameAffected) or:
		[ replayEntries isNotEmpty ]) ifTrue:
			[ replayEntries add: entries last ].
		stream nextPutAll: replayEntries ].
]

{ #category : #private }
GtEpImageModelInImageVisitor >> replayCommentEntriesFrom: aGtEpReplayBehaviorModel [
	"Only the latest comment entry counts"
	| latestCommentEntry |

	aGtEpReplayBehaviorModel hasCommentEntry ifFalse: [ ^ self ].

	latestCommentEntry := aGtEpReplayBehaviorModel latestCommentEntry.
	(self commentEntryChangesRunningSystem: latestCommentEntry) ifTrue:
		[ stream nextPut: aGtEpReplayBehaviorModel latestCommentEntry ].

]

{ #category : #accessing }
GtEpImageModelInImageVisitor >> sequencedEntries [

	^ sequencedEntries
]

{ #category : #testing }
GtEpImageModelInImageVisitor >> shouldReplayAdditionalEntry: entry [
	"Answer a boolean indicating whether the supplied entry should be replayed.
	Currently only EpExpressionEvaluations are included."

	^ entry content class == EpExpressionEvaluation
]

{ #category : #private }
GtEpImageModelInImageVisitor >> shouldReplayOnBehaviorRemoval: replayEntry [ 
	"Answer a boolean indicating whether the supplied entry should be replayed for a behavior that is later being removed, i.e. if:
	- the entry is a name change of the behavior, or
	- the behavior has subclasses that are changed after the supplied entry"

	^ replayEntry content isGtEpReplayBehaviorAddition and: 
		[ self behaviorHasSubclassesAfter: replayEntry ]
]

{ #category : #visiting }
GtEpImageModelInImageVisitor >> visitBehaviorReplay: aGtEpReplayBehaviorModel [
	"Add the entries required for replay to the stream"

	currentBehaviorModel := aGtEpReplayBehaviorModel.
	"The class can't be exported if it's superclass doesn't exist.
	Avoid adding the superclass to the image model as it shouldn't be considered known (knowsSuperclassInModel)."
	currentBehaviorModel isRemoved ifFalse:
		[ | superclass |
		superclass := image classOrTraitNamed: currentBehaviorModel superclassName
			ifAbsent: [ :clsName | clsName ifNotNil: [ self class environment classOrTraitNamed: clsName ] ].
		(superclass isNil or:
			[ superclass isObsolete ]) ifTrue:
				[ GtEpInvalidSuperclassError signalClassModel: currentBehaviorModel ] ].

	"The latest event has to be earlier than now, set a dummy entry for comparison"
	earliestBehaviorDependency := OmEntry content: EpEvent new.
	earliestBehaviorDependency tags at: EpLog timeKey put: DateAndTime now.
	self replayBehaviorRemovalFrom: aGtEpReplayBehaviorModel.
	self visitNodes: aGtEpReplayBehaviorModel methods.
	self visitNodes: aGtEpReplayBehaviorModel classSide methods.
	self replayBehaviorFrom: aGtEpReplayBehaviorModel entries: aGtEpReplayBehaviorModel entries.
	self visitNodes: aGtEpReplayBehaviorModel protocolChanges.
	self visitNodes: aGtEpReplayBehaviorModel classSide protocolChanges.
	self replayCommentEntriesFrom: aGtEpReplayBehaviorModel.
	currentBehaviorModel := nil.
]

{ #category : #visiting }
GtEpImageModelInImageVisitor >> visitImageReplay: aGtEpReplayImageModel [

	aGtEpReplayImageModel behaviors values do: [ :behavior |
		behavior accept: self ].
	aGtEpReplayImageModel entries do: [ :entry |
		(self shouldReplayAdditionalEntry: entry) ifTrue:
			[ stream nextPut: entry ] ].
]

{ #category : #visiting }
GtEpImageModelInImageVisitor >> visitMethodReplay: aGtEpReplayMethodModel [
	| entries lastEntry |

	entries := aGtEpReplayMethodModel entries.
	entries ifNotEmpty:
		[ lastEntry := entries last.
		(self methodEntryChangesRunningSystem: lastEntry) ifTrue:
			[ stream nextPut: lastEntry.
			lastEntry gtTime < earliestBehaviorDependency gtTime ifTrue:
				[ earliestBehaviorDependency := lastEntry ] ] ].
]

{ #category : #visiting }
GtEpImageModelInImageVisitor >> visitNode: aGtEpReplayImageModel [

	aGtEpReplayImageModel accept: self
]

{ #category : #visiting }
GtEpImageModelInImageVisitor >> visitNodes: aCollection [

	aCollection do: [ :node |
		self visitNode: node ].
]

{ #category : #private }
GtEpImageModelInImageVisitor >> visitProtocolReplay: aGtEpReplayProtocolModel [
	"Protocol addition is unnecessary since protocols are automatically added when a method is added.
	Protocol removal is unsafe since it may remove more methods than expected.
	The cost of not replaying protocol removal is the possibility of a few empty protocols left behind.
	Since this is safer than removing methods accidentally, ignore protocol changes.
	
	Old comment:
	Protocol entries either add an empty protocol or remove the protocol and all methods.
	So only the latest removal is required, and an addition if it comes after the removal.
	| entries lastRemoval lastAddition |

	entries := aGtEpReplayProtocolModel entries.
	entries ifNotEmpty:
		[ entries do: [ :entry |
			entry content isEpProtocolAddition
				ifTrue: [ lastAddition := entry ]
				ifFalse: [ lastRemoval := entry ] ].
		lastRemoval ifNotNil:
			[ (self protocolRemovalChangesRunningSystem: lastRemoval) ifTrue:
				[ stream nextPut: lastRemoval ].
			(lastAddition isNotNil and: [ lastAddition gtTime > lastRemoval gtTime ]) ifTrue:
				[ (self protocolAdditionChangesRunningSystem: lastRemoval) ifTrue:
					[ stream nextPut: lastRemoval ] ] ] ]."
]
