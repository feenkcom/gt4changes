Extension { #name : #EpMonitor }

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> addEvent: anEvent newEntryDo: aBlock triggerReference: triggerReference [
	<gtPharoPatch: #Pharo>
	
	| newEntry |
	newEntry := log
		addEntryWith: anEvent
		tags: [ :tags |
			triggerReference isNull ifFalse: [
				tags
					at: EpLog triggererReferenceKey
					put: triggerReference ].

			self 
				forPharo12: [
					"Ensure we have a time in Pharo 12"
					tags at: EpLog timeKey put: self time] 
				forPharo11AndPharo10: [
					tags at: EpLog authorKey put: self author.
					tags at: EpLog timeKey put: self time ] ].

	aBlock value: newEntry
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> behaviorRemoved: aClassRemovedAnnouncement [
	"Process the behavior removal announcement"
	"GT note: The error handler is removed in Pharo12 and unused in Pharo11, so removed here"
	| toReplace classRemoved |

	"Workaround: the announcement occurs after class is renamed to AnObsolete
		and removed from package."
	classRemoved := aClassRemovedAnnouncement classRemoved asEpiceaRingDefinition.

	"Fix class name (remove AnObsolete prefix)"
	classRemoved definitionSource: (classRemoved definitionSource
			 copyReplaceAll: aClassRemovedAnnouncement classRemoved name asString
			 with: aClassRemovedAnnouncement classRemoved originalName asString).

	"Fix class name in the metaclass"
	classRemoved classSide definitionSource:
		(classRemoved classSide definitionSource copyReplaceAll: aClassRemovedAnnouncement classRemoved name with: aClassRemovedAnnouncement classRemoved originalName).

	"Fix category"
	toReplace := (classRemoved definitionSource includesSubstring: '_UnpackagedPackage')
		             ifTrue: [ 'package: ' , '_UnpackagedPackage' printString ]
		             ifFalse: [ 'package: ' , 'Unclassified' printString ].

	classRemoved definitionSource: (classRemoved definitionSource copyReplaceAll: toReplace with: 'package: ' , aClassRemovedAnnouncement packageTagAffected categoryName printString).

	classRemoved name: aClassRemovedAnnouncement classRemoved originalName.
	classRemoved package: aClassRemovedAnnouncement packageAffected name.
	classRemoved packageTag: aClassRemovedAnnouncement packageTagAffected name.

	aClassRemovedAnnouncement classRemoved methods , aClassRemovedAnnouncement classRemoved classSide metaMethods do: [ :each |
		self behaviorRemovedImpliesMethodRemoved: each defaultPackageName: classRemoved package ].

	aClassRemovedAnnouncement classAffected isTrait
		ifTrue: [ self traitRemoved: classRemoved ]
		ifFalse: [ self classRemoved: classRemoved ]
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewChangeFilesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Changes files';
		priority: 25;
		object: [ self sessionStore ];
		view: #gtViewChangeFilesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewChangeTreeFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Changes tree';
		priority: 45;
		object: [ self sessionStore ];
		view: #gtViewChangeTreeFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewEntriesFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries';
		priority: 5;
		object: [ log ];
		view: #gtViewEntriesFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Entries list';
		priority: 10;
		object: [ log ];
		view: #gtViewEntriesListFor:
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor class >> shutDown: isImageQuitting [
	"If enabled, record a snapshot event.
	Always open a new file on snapshot"

	self hasCurrent ifTrue:
		[ (isImageQuitting not and: [ self current isEnabled ]) ifTrue: 
			[ self current sessionSnapshot ].
		self current sessionStore flush.
		"Force a new log file on every image save.
		self current log store resetWithNextStoreName." ].
]

{ #category : #'*GToolkit4Epicea' }
EpMonitor class >> startUp: isStarting [
	"If --epiceaMemoryStore has been flagged switch to an OmMemoryStore"

	isStarting ifFalse: [ ^ self ].
	(Smalltalk argumentsInclude: '--epiceaMemoryStore') ifFalse: [ ^ self ].

	EpMonitor current log initializeWith: OmMemoryStore new
]
