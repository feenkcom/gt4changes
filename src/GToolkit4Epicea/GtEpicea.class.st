Class {
	#name : #GtEpicea,
	#superclass : #Object,
	#traits : 'TBlDebug + TLepiterConstants + TGtAnnouncer',
	#classTraits : 'TBlDebug classTrait + TLepiterConstants classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'epiceaLog',
		'events',
		'diff',
		'applyErrorHandler',
		'impacted',
		'previousNumberOfEvents'
	],
	#classVars : [
		'DebugMode'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpicea class >> allInSessionStore [
	<script>
	| monitor directory currentGlobalName |
	monitor := EpMonitor current.
	directory := monitor sessionStore baseLocator.
	currentGlobalName := monitor sessionStore store globalName.
	^ (EpFileLogNode fromAllLogsIn: directory)
		sort: [ :a :b | a modificationTime >= b modificationTime ];
		collect: [ :n | 
			| node |
			node := n globalName = currentGlobalName
				ifTrue: [ EpMonitorLogNode for: monitor ]
				ifFalse: [ n ].
			self new
				log: node log;
				yourself ]
]

{ #category : #accessing }
GtEpicea class >> constants [
	^ LepiterConstants
]

{ #category : #accessing }
GtEpicea class >> current [
	<script>
	^ self new log: (EpMonitorLogNode for: EpMonitor current) log
]

{ #category : #accessing }
GtEpicea class >> iconForEpiceaChange: anEpChange [
	^ self 
		forPharo12: [
			Smalltalk ui icons iconNamed: (anEpChange accept: EpIconNameVisitor new)  ] 
		forPharo11AndPharo10: [ 
			 anEpChange accept: EpIconVisitor new ]
]

{ #category : #modification }
GtEpicea >> addEvent: anEpEvent [
	self log addEntryWith: anEpEvent tags: [ :tags | "ignore" ].
	self log store flush.
	self notifyEpiceaChanged.
]

{ #category : #accessing }
GtEpicea >> announcer [
	^ announcer
]

{ #category : #modification }
GtEpicea >> applyChanges [
	| sequencedEntries |
	self assert: [ self log notNil ] description: [ 'Epicea log must be non-nil.' ].
	self hasChanges ifFalse: [ ^ self ].
	sequencedEntries := (self entries allSatisfy: #hasTime)
		ifTrue: [ GtEpInImageEventSequencer sequence: self entries ]
		ifFalse: [ self entries ].
	sequencedEntries do: [ :each | each content applyCodeChangeIfHasImpact ].
	self notifyEpiceaChanged
]

{ #category : #private }
GtEpicea >> computeImpact [
	"Return true if impact changed"

	<return: #Boolean>
	| oldImpacted changed |
	oldImpacted := impacted.
	impacted := self events
		select: [ :eachEvent | 
			eachEvent isCodeChange
				ifTrue: [ eachEvent
						accept: (EpHasImpactVisitor inEnvironment: self theEnvironment) ]
				ifFalse: [ false ] ].
	changed := impacted ~= oldImpacted.
	changed
		ifTrue: [ diff := nil ].
	^ changed
]

{ #category : #accessing }
GtEpicea >> constants [
	^ LepiterConstants
]

{ #category : #'gt-extension' }
GtEpicea >> createChangeList [
	| aList |
	aList := BrColumnedList new
			itemsProvider: self log entriesStream asBrItemsProvider;
			aptitude: BrColumnedMultiListAptitude.

	aList column
		title: 'Icon';
		width: 32;
		stencil: [ :anOmbuEntry :anIndex | 
			anOmbuEntry gtViewChangeIcon asElement
				margin: (BlInsets left: 5 right: 5) ].
	aList column
		title: 'Description';
		stencil: [ :anOmbuEntry :anIndex | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anOmbuEntry content accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].

	aList
		rowStencil: (GtPhlowColumnedListItemElementWithContextMenuDecorator new
				stencilBuilder: BrGlamorousColumnedListSelectableRowElementStencilBuilder new).

	^ aList fitContent margin: (BlInsets top: 5)
]

{ #category : #'gt-extension' }
GtEpicea >> createChangeTabs [
	| aTabGroup changesList globalChangesList |
	aTabGroup := BrTabGroup new aptitude: BrGlamorousTabGroupAptitude.

	changesList := self createChangeList.
	globalChangesList := self createGlobalChangeList.

	aTabGroup
		addTab: (BrTab new
				aptitude: BrGlamorousTabAptitude new;
				label: 'Changes';
				stencil: [ changesList ]).
	aTabGroup
		addTab: (BrTab new
				aptitude: BrGlamorousTabAptitude new;
				label: 'Global Changes';
				stencil: [ globalChangesList ]).

	aTabGroup
		actionbarStencil: [ BrToolbar new
				aptitude: BrGlamorousToolbarAptitude new;
				addItem: (BrButton new
						aptitude: BrGlamorousButtonWithIconAptitude;
						icon: BrGlamorousVectorIcons add;
						label: 'Add Selected';
						action: [ globalChangesList selectedIndices
								do: [ :anIndex | self addEvent: (globalChangesList items at: anIndex) content ].
							changesList itemsProvider: self log entriesStream asBrItemsProvider ]);
				addItem: (BrButton new
						aptitude: BrGlamorousButtonWithIconAptitude;
						icon: BrGlamorousVectorIcons remove;
						label: 'Remove Selected';
						action: [ changesList selectedIndices
								do: [ :anIndex | self removeEntry: (changesList items at: anIndex) ] ]) ].

	^ aTabGroup
		hExact: 400;
		vExact: 250;
		padding: (BlInsets all: 5);
		addAptitude: BrGlamorousWithVerticalResizerAptitude;
		addAptitude: BrGlamorousWithHorizontalResizerAptitude
]

{ #category : #'gt-extension' }
GtEpicea >> createGlobalChangeList [
	| aList |
	aList := BrColumnedList new
			itemsProvider: EpMonitor current log entries reversed asBrItemsProvider;
			aptitude: BrColumnedMultiListAptitude.

	aList column
		title: 'Icon';
		width: 32;
		stencil: [ :anOmbuEntry :anIndex | 
			anOmbuEntry gtViewChangeIcon asElement
				margin: (BlInsets left: 5 right: 5) ].
	aList column
		title: 'Description';
		stencil: [ :anOmbuEntry :anIndex | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anOmbuEntry content accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].

	aList
		rowStencil: (GtPhlowColumnedListItemElementWithContextMenuDecorator new
				stencilBuilder: BrGlamorousColumnedListSelectableRowElementStencilBuilder new).

	^ aList matchParent margin: (BlInsets top: 5)
]

{ #category : #accessing }
GtEpicea >> diff [
	<return: #BlRope>
	^ diff ifNil: [ 
			diff := self hasImpact 
				ifTrue: [ 
					GtEpiceaDiffStencil new
						from: self systemState;
						to: self tutorialState;
						create ]
				ifFalse: [ '"No changes comparing to current system state"' asRopedText 
						glamorousCodeFontAndSize;
						foreground: self constants subtleColor ] ]
]

{ #category : #'gt-extension' }
GtEpicea >> diffElements [
	| elements |
	elements := OrderedCollection new.
	self events
		do: [ :each | 
			| previous change styler new element |
			previous := each
					accept: ((GtEpiceaCurrentStateVisitor inEnvironment: self class environment)
							showClassNameInMethodSource: false).
			new := each accept: EpNewStateVisitor new.
			previous = new
				ifFalse: [ change := GtDiffBuilder
							computeDifferencesFrom: previous
							to: new
							using: GtSmaCCDiffSplitter forPharo.
					styler := GtCodeDiffRBTextStyler new.
					styler isForWorkspace: (each isKindOf: EpMethodChange) not.
					element := BrVerticalPane new.
					element margin: (BlInsets all: 3).
					element hMatchParent.
					element vFitContent.
					element
						addChild: ((GtEpiceaDiffElement onChange: change)
								aptitude: GtDiffFlatAptitude;
								vFitContent;
								styler: styler;
								beSmallSize).
					element
						addChild: (BrButton new
								aptitude: BrGlamorousButtonWithIconAptitude;
								icon: BrGlamorousVectorIcons accept;
								label: 'Accept';
								margin: (BlInsets
										top: 0
										left: 5
										bottom: 5
										right: 0);
								action: [ each applyCodeChange ]).
					element addAptitude: (BrShadowAptitude new width: 1).
					elements add: element ] ].
	^ elements
]

{ #category : #accessing }
GtEpicea >> entries [
	<return: #OrderedCollection of: #OmEntry>
	^ self log entries
]

{ #category : #accessing }
GtEpicea >> events [
	<return: #OrderedCollection of: #EpEvent>
	^ events
]

{ #category : #'gt-extension' }
GtEpicea >> gtDiffsFor: aView [

	<gtView>
	<gtViewChanges>
	^ aView explicit
		  title: 'Diff';
		  priority: 1;
		  updateWhen: GtEpiceaUpdatedAnnouncement in: self announcer;
		  actionUpdateButton;
		  actionButtonIcon: BrGlamorousVectorIcons accept
		  tooltip: 'Apply changes'
		  action: [ self applyChanges ];
		  actionDropdownButtonIcon: BrGlamorousVectorIcons filter
		  tooltip: 'Select'
		  content: [ self createChangeTabs ];
		  stencil: [ 
			  | element headerElement label diffElement |
			  element := BrVerticalPane new.
			  element matchParent.
			  headerElement := BrHorizontalPane new
				                   padding: (BlInsets all: 0);
				                   hMatchParent;
				                   vFitContent.
			  label := BrLabel new aptitude: BrGlamorousLabelAptitude.
			  label text:
				  ('Current:' asRopedText glamorousCodeSmallSize foreground:
					   BrGlamorousColors defaultButtonTextColor).
			  label margin: (BlInsets left: 15).
			  label hMatchParent.
			  headerElement addChild: label.
			  headerElement addChild: (BlElement new
					   height: 0;
					   width: 15;
					   yourself).
			  label := BrLabel new aptitude: BrGlamorousLabelAptitude.
			  label text:
				  ('Change:' asRopedText glamorousCodeSmallSize foreground:
					   BrGlamorousColors defaultButtonTextColor).
			  label hMatchParent.
			  headerElement addChild: label.
			  element addChild: headerElement.
			  diffElement := BrVerticalPane new.
			  diffElement hMatchParent.
			  diffElement vFitContent.
			  diffElement addChildren: self diffElements.
			  element addChild: diffElement asScrollableElement.
			  element ]
]

{ #category : #'gt-extension' }
GtEpicea >> gtPreviewFor: aView [

	^ aView composite
		  title: 'Document Preview';
		  priority: 50;
		  collectorDo: [ :aCollector | 
			  aCollector
				  pragmaName: #gtViewChanges;
				  fromObject: self ]
]

{ #category : #'gt-extension' }
GtEpicea >> gtTutorialFor: aView [
	<gtView>
	<gtViewChanges>
	^ aView textEditor
		title: 'Code';
		priority: 0;
		aptitude: BrGlamorousCodeEditorAptitude;
		updateWhen: GtEpiceaUpdatedAnnouncement in: self;
		actionUpdateButton;
		actionButtonDo: [ :aButtonAction | 
			aButtonAction
				id: GtEpiceaApplyChangesId;
				icon: BrGlamorousVectorIcons accept;
				tooltip: 'Apply changes';
				action: [ self applyChanges ] ];
		actionDropdownButtonIcon: BrGlamorousVectorIcons filter
			tooltip: 'Select'
			content: [ self createChangeTabs ];
		text: [ :anEditor | self tutorialStateRope ]
]

{ #category : #'announcement handling' }
GtEpicea >> handleEpEntryAddedAnnouncement: anEpEntryAdded [
	self privateAddEvent: anEpEntryAdded entry content.
	self notifyEpiceaChanged.
]

{ #category : #testing }
GtEpicea >> hasChanges [
	<return: #Boolean>
	^ self numberOfEvents isZero not
]

{ #category : #accessing }
GtEpicea >> hasImpact [
	"Return true, if changes have impact to the current system state"
	<return: #Boolean>
	^ impacted notEmpty
]

{ #category : #initialization }
GtEpicea >> initialize [
	super initialize.
	announcer := Announcer new.
	impacted := OrderedCollection new.
	previousNumberOfEvents := 0.
	applyErrorHandler := [ :anException | | message |
		DebugMode ifTrue: [ anException pass ].
		message := 'Error while applying Epicea changes: ' , anException asString.
		message traceCr.
		self inform: message ].
]

{ #category : #accessing }
GtEpicea >> log [
	<return: #EpLog>
	^ epiceaLog
]

{ #category : #accessing }
GtEpicea >> log: anEpLog [
	self log ifNotNil: [ self log announcer unsubscribe: self ].
	epiceaLog := anEpLog.
	self privateEvents: (self entries collect: #content).
	self log announcer
		when: EpEntryAdded
		send: #handleEpEntryAddedAnnouncement:
		to: self.
	self notifyEpiceaChanged
]

{ #category : #notifying }
GtEpicea >> notifyEpiceaChanged [
	| anImpactChanged |
	anImpactChanged := self computeImpact.
	self notifyEpiceaChangedWithImpactState: self hasImpact impactChanged: anImpactChanged.
]

{ #category : #notifying }
GtEpicea >> notifyEpiceaChangedWithImpactState: anImpactStateBoolean impactChanged: anImpactChangeBoolean [
	| anAnnouncement |
	anAnnouncement := (GtEpiceaUpdatedAnnouncement new 
		hasImpact: anImpactStateBoolean;
		impactChanged: anImpactChangeBoolean;
		numberOfEvents: self numberOfEvents;
		previousNumberOfEvents: previousNumberOfEvents).
	previousNumberOfEvents := self numberOfEvents.
	self announce: anAnnouncement.
]

{ #category : #accessing }
GtEpicea >> numberOfEvents [
	<return: #Integer>
	^ events ifNotNil: #size ifNil: 0
]

{ #category : #accessing }
GtEpicea >> ombuFile [
	<return: #FileReference>
	^ self log store writingFileReference
]

{ #category : #accessing }
GtEpicea >> ombuFile: aFileReference [
	self log: (EpLog fromFile: aFileReference)
]

{ #category : #testing }
GtEpicea >> ombuFileExists [
	<return: #Boolean>
	^ self ombuFile notNil and: [ self ombuFile exists ]
]

{ #category : #accessing }
GtEpicea >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self log store printOn: aStream.
	aStream nextPut: $)
]

{ #category : #private }
GtEpicea >> privateAddEvent: anEpEvent [
	events addLast: anEpEvent.
	diff := nil.
]

{ #category : #private }
GtEpicea >> privateEvents: aCollection [
	events := aCollection.
	diff := nil.
]

{ #category : #'gt-extension' }
GtEpicea >> removeEntry: anEpEntry [
	| aNewEntries |
	aNewEntries := self entries reject: [ :eachEntry | eachEntry = anEpEntry ].
	self log gtReset.
	aNewEntries do: [ :eachEvent | 
		self log addEntryWith: eachEvent content tags: [ :tags | "ignore" ] ].
	self log store flush.
	self privateEvents: (aNewEntries collect: #content).
	self notifyEpiceaChanged.
]

{ #category : #accessing }
GtEpicea >> systemState [
	<return: #String>
	^ String streamContents: [ :aStream | 
		self events 
			do: [ :eachEvent | 
				| anOutput |
				anOutput := eachEvent accept: (GtEpiceaCurrentStateVisitor 
					inEnvironment: self theEnvironment).
				aStream nextPutAll: anOutput ]
			separatedBy: [ aStream cr; cr ] ]
]

{ #category : #accessing }
GtEpicea >> theEnvironment [
	^ self class environment
]

{ #category : #accessing }
GtEpicea >> tutorialState [
	<return: #String>
	^ String streamContents: [ :aStream | 
		self events 
			do: [ :eachEvent | 
				| anOutput |
				anOutput := eachEvent accept: GtEpiceaNewStateVisitor new.
				aStream nextPutAll: anOutput ]
			separatedBy: [ aStream cr; cr ] ]
]

{ #category : #accessing }
GtEpicea >> tutorialStateRope [
	<return: #BlRope>
	^ self tutorialState asRopedText
			glamorousCodeFontAndSize; 
			foreground: self constants matchLineColor
]

{ #category : #modification }
GtEpicea >> updateImpact [
	"Return true if impact changed"
	<return: #Boolean>
	| anImpactChanged |
	anImpactChanged := self computeImpact.
	anImpactChanged ifTrue: [ 
		self notifyEpiceaChangedWithImpactState: self hasImpact impactChanged: anImpactChanged ].
	^ anImpactChanged
]
