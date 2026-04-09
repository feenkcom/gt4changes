Class {
	#name : #GtEpImageModelExportVisitor,
	#superclass : #Object,
	#instVars : [
		'image',
		'sequencedEntries',
		'currentBehaviorModel',
		'wrappedEntries'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpImageModelExportVisitor class >> image: aGtEpReplayImageModel [ 

	^ self new image: aGtEpReplayImageModel
]

{ #category : #sequencing }
GtEpImageModelExportVisitor class >> sequencedEntriesFrom: aCollectionOfEntries [
	| visitor image replay |

	visitor := GtEpReplayEventVisitor new.
	visitor visitNodes: aCollectionOfEntries.
	image := visitor image.
	replay := self image: image.
	^ replay sequencedEntries.
]

{ #category : #private }
GtEpImageModelExportVisitor >> addBehaviorEntriesFrom: aGtEpReplayBehaviorModel [
	"Process the class definition entries from the supplied model"

	aGtEpReplayBehaviorModel previousLives do: [ :behaviorModel |
		"If the previous life has subclasses all class modifications must be kept"
		behaviorModel subclassed ifTrue:
			[ behaviorModel entries do: [ :entry | entry classification: #required ] ]
		ifFalse:
		[ "Otherwise only name changes and the final remove event are required"
		behaviorModel entries last classification: #required.
		behaviorModel entries do: [ :entry |
			entry content isEpBehaviorNameChange ifTrue:
				[ entry classification: #required ] ] ] ].
	"All entries are required for the supplied behavior."
	aGtEpReplayBehaviorModel entries do: [ :entry |
		entry classification: #required ].
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> classChains [
	"Answer the wrapped entries organised in to chains of class definitions."
	| chains completedChains |

	chains := OrderedCollection new.
	completedChains := OrderedCollection new.
	wrappedEntries do: [ :entry | | event behaviorName chain |
		event := entry content.
		event isEpBehaviorChange ifTrue:
			[ behaviorName := event behaviorAffectedName.
			"Find the appropriate chain, or start a new one"
			chain := chains
				detect: [ :aChain | aChain last content behaviorAffectedName = behaviorName ]
				ifFound: [ :aChain | aChain ]
				ifNone: [ chains add: OrderedCollection new ].
			chain add: entry.
			"Behaviour removals mean that a new chain should be started"
			(event isEpClassRemoval or: [ event isEpTraitRemoval ]) ifTrue:
				[ completedChains add: chain.
				chains remove: chain. ] ] ].

	completedChains addAll: chains.
	^ completedChains
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> entries [

	^ image entries
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> environment [

	^ self class environment
]

{ #category : #private }
GtEpImageModelExportVisitor >> getSequencedEntries [

	self visitNode: self image.
	self postProcessWrappedEntries.
	^ wrappedEntries select: #isRequired thenCollect: #omEntry
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> image [

	^ image ifNil:
		[ | visitor | 
		visitor := GtEpReplayEventVisitor new.
		visitor visitNodes: wrappedEntries.
		image := visitor image ].
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> image: anObject [
	image := anObject
]

{ #category : #testing }
GtEpImageModelExportVisitor >> isClassDefinition: wrappedEntry [
	| event |
	
	event := wrappedEntry content.
	^ event isEpClassAddition or: [ event isEpClassModification ]
]

{ #category : #private }
GtEpImageModelExportVisitor >> postProcessWrappedEntries [

	self removeContigousClassDefinitions
]

{ #category : #private }
GtEpImageModelExportVisitor >> removeContigousClassDefinitions [

	wrappedEntries allButLast doWithIndex: [ :wrappedEntry :index | | nextEntry |
		(wrappedEntry isRequired and: [ self isClassDefinition: wrappedEntry ]) ifTrue:
			[ | nextIndex |
			nextIndex := index + 1.
			[ nextIndex <= wrappedEntries size and: [ (nextEntry := wrappedEntries at: nextIndex) isRequired not ] ]
				whileTrue: [ nextIndex := nextIndex + 1 ].
			(self isClassDefinition: nextEntry) ifTrue:
				[ (wrappedEntry content behaviorAffectedName = nextEntry content behaviorAffectedName) ifTrue:
					[ wrappedEntry classification: #superseeded ] ] ] ]
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> replayCommentEntriesFrom: aGtEpReplayBehaviorModel [
	"Only the latest comment entry counts"
	| latestCommentEntry |

	aGtEpReplayBehaviorModel hasCommentEntry ifFalse: [ ^ self ].

	latestCommentEntry := aGtEpReplayBehaviorModel latestCommentEntry.
	(self shouldReplayCommentEntry: latestCommentEntry) ifTrue:
		[ aGtEpReplayBehaviorModel latestCommentEntry classification: #required ].
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> sequencedEntries [
	^ sequencedEntries ifNil: [ sequencedEntries := self getSequencedEntries ]
]

{ #category : #testing }
GtEpImageModelExportVisitor >> shouldAddMethod: aGtEpReplayMethodModel [
	"The relevant method entry is always added for export"
	
	^ true
]

{ #category : #testing }
GtEpImageModelExportVisitor >> shouldReplayAdditionalEntry: entry [
	"Answer a boolean indicating whether the supplied entry should be replayed.
	Currently only EpExpressionEvaluations are included."

	^ entry content class == EpExpressionEvaluation
]

{ #category : #testing }
GtEpImageModelExportVisitor >> shouldReplayCommentEntry: latestCommentEntry [

	^ true
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitBehaviorReplay: aGtEpReplayBehaviorModel [
	"Add the entries required for replay to the stream"

	currentBehaviorModel := aGtEpReplayBehaviorModel.
	self addBehaviorEntriesFrom: aGtEpReplayBehaviorModel.
	aGtEpReplayBehaviorModel isRemoved ifFalse:
		[ self visitNodes: aGtEpReplayBehaviorModel methods.
		self visitNodes: aGtEpReplayBehaviorModel classSide methods.
		self visitNodes: aGtEpReplayBehaviorModel protocolChanges.
		self visitNodes: aGtEpReplayBehaviorModel classSide protocolChanges.
		self replayCommentEntriesFrom: aGtEpReplayBehaviorModel.
		currentBehaviorModel := nil. ].
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitImageReplay: aGtEpReplayImageModel [

	aGtEpReplayImageModel behaviors values do: [ :behavior |
		behavior accept: self ].
	aGtEpReplayImageModel entries do: [ :entry |
		(self shouldReplayAdditionalEntry: entry) ifTrue:
			[ entry classification: #required ] ].
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitMethodReplay: aGtEpReplayMethodModel [

	aGtEpReplayMethodModel entries ifNotEmpty: [ :entries |
	(self shouldAddMethod: aGtEpReplayMethodModel) ifTrue:
			[ entries last classification: #required ] ].
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitNode: aGtEpReplayImageModel [

	aGtEpReplayImageModel accept: self
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitNodes: aCollection [

	aCollection do: [ :node |
		self visitNode: node ].
]

{ #category : #visiting }
GtEpImageModelExportVisitor >> visitProtocolReplay: aGtEpReplayProtocolModel [
	"Protocol addition is unnecessary since protocols are automatically added when a method is added.
	Protocol removal is unsafe since it may remove more methods than expected.
	The cost of not replaying protocol removal is the possibility of a few empty protocols left behind.
	Since this is safer than removing methods accidentally, ignore protocol changes."
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> wrappedEntries [
	^ wrappedEntries
]

{ #category : #accessing }
GtEpImageModelExportVisitor >> wrappedEntries: anObject [
	wrappedEntries := anObject
]
