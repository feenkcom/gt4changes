Class {
	#name : #GtEpiceaAbstractLog,
	#superclass : #Object,
	#traits : 'TGtEpiceaLogView',
	#classTraits : 'TGtEpiceaLogView classTrait',
	#instVars : [
		'headReference'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaAbstractLog >> addToolbarButtonsTo: aView withModel: changeListModel [
	| methods |
	methods := (Pragma allNamed: #gtChangeAction from: GtEpiceaAbstractLog to: self class)
			collect: #methodSelector.
	methods
		do: [ :aSelector | 
			self
				perform: aSelector
				withArguments: {aView.
						changeListModel} ]
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> additionFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | 
			aStream
				filter: [ :anEntry | 
					anEntry content isCodeChange
						and: [ anEntry content class name endsWith: #Addition ] ] ];
		named: 'Addition';
		order: 12;
		valueNotRequired;
		beNotDefault
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> allEntriesFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | aStream ];
		named: 'All Changes';
		order: 0;
		valueNotRequired;
		beNotDefault
]

{ #category : #'accessing - grouping' }
GtEpiceaAbstractLog >> behaviorChangesGroupedByClass [
	^ (self entries 
		select: [ :anOmbuEntry |
			anOmbuEntry content isEpBehaviorChange  ])
		groupedBy: [ :anOmbuEntry | 
			anOmbuEntry content behaviorAffected instanceSide ]
]

{ #category : #'accessing - history' }
GtEpiceaAbstractLog >> branches [
	^ GtEpiceaBranchesHistoryBuilder
		buildHistoryForEntriesGroup: self entriesGroup
]

{ #category : #accessing }
GtEpiceaAbstractLog >> canBeFrozen [
	^ true
]

{ #category : #accessing }
GtEpiceaAbstractLog >> changedClassNames [
	| changedClassesVisitor |
	
	changedClassesVisitor := GtEpiceaChangedClassNamesVisitor new.
	self entries do: [ :anEntry |
		anEntry content ifNotNil: [ :aChange |
			aChange accept: changedClassesVisitor ] ].
		
	^ changedClassesVisitor changedClassNames
]

{ #category : #accessing }
GtEpiceaAbstractLog >> changesGroupedByBranch [
	| headNodes |

	headNodes := GtEpiceaUtilities branchesHeadLogNodesFrom: self entries.
	^ headNodes collect: [ :node | node entry -> node entries ].
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> classFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream :aClass | 
			aStream
				filter: [ :anEntry | 
					anEntry content isCodeChange and: [ anEntry content isEpCategoryChange not
						and: [ anEntry content behaviorAffectedName = aClass ] ] ] ];
		named: 'In Class';
		order: 15;
		completion: [ GtStringsCompletionStrategy new
				completions: [ GtPrefixTree withAll: (Smalltalk allClasses collect: #name) ] ];
		beNotDefault
]

{ #category : #'accessing - history' }
GtEpiceaAbstractLog >> classHistories [
	^ GtEpiceaClassesHistoryBuilder 
		buildHistoryForEntriesGroup: self entriesGroup
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> codeChangesFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | 
			aStream
				filter: [ :anEntry | 
					anEntry content isCodeChange ] ];
		named: 'Code Changes';
		order: 15;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> codeEvents [
	^ self entries select: [ :anEntry | anEntry content isCodeChange ]
]

{ #category : #accessing }
GtEpiceaAbstractLog >> entries [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> entriesGroup [
	^ GtEpiceaEntriesGroup withAll: self entries
]

{ #category : #accessing }
GtEpiceaAbstractLog >> entriesStream [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> exportFilter [
	"Filter the events down to only those that would be exported for replay in another image to sync it with the current image."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | explicitLog sorted |
			explicitLog := GtEpiceaExplicitLog on: aStream toArray wait.
			sorted := (GtEpEventSequencer 
				entries: explicitLog entries 
				inImage: false)
					sequencedEntries.
			AsyncSequenceStream forCollection: sorted reversed ];
		named: 'Export';
		order: 25;
		valueNotRequired;
		beNotDefault
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtApplyFor: anAction [
	<gtAction>
	^ anAction dropdown
		label: 'Apply';
		priority: 5;
		content: [ :aButton | 
			GtEpiceaApplyChangesDetailsElement new
				entries: self entries;
				anchor: aButton ]
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtEventsFor: aView [
	<gtView>
	<gtViewChanges>
	| view changeListModel |
	changeListModel := GtEpiceaChangeListModel onLog: self.

	view := aView explicit
			title: 'Change List';
			priority: 3;
			stencil: [ (GtEpiceaChangeListElement forModel: changeListModel)
					padding: (BlInsets top: 5) ].

	view
		actionDropdownButtonLabel: 'Apply'
		tooltip: 'Apply Selected Changes'
		content: [ :aButton | 
			GtEpiceaApplyChangesDetailsElement new
				entries: changeListModel selectedCodeEvents;
				anchor: aButton ].

	self addToolbarButtonsTo: view withModel: changeListModel.

	^ view
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtImpactFor: aView [
	<gtView>
	
	^ aView columnedList
		  title: 'Impact';
		  priority: 20;
		  items: [ 
		  	(GtEpEventSequencer 
		  		sequence: self entries 
		  		withCurrent: false) collect: #content ];
		  column: 'Icon' 
		  	icon: [ :anEpEvent :anIndex | 
			  	(anEpEvent accept: EpIconVisitor new) asElement ]
		 	 width: 32;
		  column: 'Description' stencil: [ :anEpEvent :anIndex | 
			  BlElement new
				  layout: BlLinearLayout horizontal;
				  addChildren:
					  (anEpEvent accept: GtEpiceaBrickVisitor new);
				  constraintsDo: [ :c | 
					  c horizontal fitContent.
					  c vertical exact: 24 ] ]
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtViewBranchesFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView forward 
		title: 'By Branch';
		priority: 45;
		object: [ self branches ];
		view: #gtViewHistoriesFor: 
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtViewClassHistoriesFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView forward 
		title: 'By Class';
		priority: 35;
		object: [ self classHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Entries List';
		priority: 5;
		items: [ self entriesStream ];
		column: 'Icon'
			icon: [ :anOmbuEntry | 
				anOmbuEntry content accept: EpIconVisitor new ]
			width: 32;
		column: 'Event'
			text: [ :anOmbuEntry | anOmbuEntry content ];
		column: 'Event'
			text: [ :anOmbuEntry | anOmbuEntry gtTime printToSeconds ]
			width: 150
]

{ #category : #accessing }
GtEpiceaAbstractLog >> gtViewLatestChangesFor: aView [
	<gtView>
	<gtViewChanges>

	^ aView forward
		title: 'Recover latest';
		priority: 10;
		object: [ self recoverLatest ];
		view: #gtEventsFor:
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtViewMethodHistoriesFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView forward 
		title: 'By Method';
		priority: 35;
		object: [ self methodHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> gtViewPackageHistoriesFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView forward 
		title: 'By Package';
		priority: 45;
		object: [ self packageHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> headReference [

	^ headReference ifNil: 
		[ headReference := (self orderEntries: self entries) first tagAt: #self ].
]

{ #category : #accessing }
GtEpiceaAbstractLog >> historyFilter [
	"Filter the events showing the history of events leading to the latest change, i.e. the latest branch in the current collection of events."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream |
			AsyncSequenceStream forCollection: 
				(GtEpiceaExplicitLog on: aStream toArray wait) priorEntriesFromHead ];
		named: 'History';
		order: 20;
		valueNotRequired;
		beNotDefault
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> impactFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | 
			aStream
				filter: [ :anEntry | 
					anEntry content isCodeChange and: [ anEntry content accept: (EpHasImpactVisitor inEnvironment: self class environment)] ] ];
		named: 'Hide Redundant';
		order: 15;
		valueNotRequired;
		beNotDefault
]

{ #category : #initialization }
GtEpiceaAbstractLog >> initialize [
	frozen := false
]

{ #category : #accessing }
GtEpiceaAbstractLog >> isActive [
	^ self subclassResponsibility
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> latestFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | aStream withoutDuplicatesBasedOn: [ :aChange | aChange content affectedMarker ] ];
		named: 'Latest';
		order: 12;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> log [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> logs [
	^ self subclassResponsibility
]

{ #category : #'accessing - grouping' }
GtEpiceaAbstractLog >> methodChangesGroupedByAffectedMethod [
	^ (self entries 
		select: [ :anOmbuEntry |
			anOmbuEntry content isEpMethodChange ])
		groupedBy: [ :anOmbuEntry | anOmbuEntry content methodAffected ]
]

{ #category : #'accessing - history' }
GtEpiceaAbstractLog >> methodHistories [
	^ GtEpiceaMethodsHistoryBuilder
		buildHistoryForEntriesGroup: self entriesGroup
]

{ #category : #accessing }
GtEpiceaAbstractLog >> name [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> orderEntries: aCollectionOfEvents [
	^ aCollectionOfEvents sorted: [:a :b | (self timeAt: a) > (self timeAt: b)]
]

{ #category : #'accessing - filters' }
GtEpiceaAbstractLog >> packageFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream :aPackage | 
			aStream
				filter: [ :anEntry | 
					anEntry content isCodeChange
						and: [ anEntry content affectedPackageName = aPackage ] ] ];
		named: 'In Package';
		order: 15;
		completion: [ GtStringsCompletionStrategy new
				completions: [ GtPrefixTree withAll: (RPackage organizer packages collect: #name) ] ];
		beNotDefault
]

{ #category : #'accessing - history' }
GtEpiceaAbstractLog >> packageHistories [
	^ GtEpiceaPackagesHistoryBuilder 
		buildHistoryForEntriesGroup: self entriesGroup
]

{ #category : #enumerating }
GtEpiceaAbstractLog >> priorEntriesFrom: aReference [
	"Answer the chain of events leading up to the supplied reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."

	^ Array streamContents: [  :stream |
		self 
			priorEntriesFrom: aReference 
			backTo: OmNullReference uniqueInstance
			do: [ :anEntry | stream nextPut: anEntry ] ]
]

{ #category : #enumerating }
GtEpiceaAbstractLog >> priorEntriesFrom: endOmReference backTo: startOmReference do: aBlock [
	"Evaluate aBlock for each event in the chain of events leading up to the supplied reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."
	| allEntries omReferenceDictionary  currentEntry |

	allEntries := self entries.
	omReferenceDictionary := Dictionary new: allEntries size * 2.
	allEntries do: [ :each |
		omReferenceDictionary at: (each tagAt: #self) put: each ].
	currentEntry := omReferenceDictionary at: endOmReference ifAbsent: [ nil ].
	[ currentEntry isNil or: [ (currentEntry tagAt: #self) = startOmReference ] ] whileFalse:
		[ aBlock value: currentEntry.
		currentEntry := omReferenceDictionary at: (currentEntry tagAt: #prior) ifAbsent: [ nil ] ].
]

{ #category : #enumerating }
GtEpiceaAbstractLog >> priorEntriesFromHead [
	"Answer the chain of events leading up to the head reference, in reverse chronological order.
	Events that are not part of the headReference are excluded."

	^ self priorEntriesFrom: self headReference.
]

{ #category : #accessing }
GtEpiceaAbstractLog >> recoverFilter [
	"Filter out any events which don't have an impact in the current system, taking the event history in to account."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | explicitLog sorted |
			explicitLog := GtEpiceaExplicitLog on: aStream toArray wait.
			sorted := (GtEpEventSequencer 
				entries: explicitLog entries 
				inImage: true)
					sequencedEntries.
			AsyncSequenceStream forCollection: sorted reversed ];
		named: 'Recover';
		order: 20;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> recoverLatest [
	"Answer a branch history filtered to the changes required to recover the image."
	| entries |

	entries := (GtEpEventSequencer
		entries: self entriesGroup changesGroupedByBranch first value
		inImage: true)
			sequencedEntries.
	^ GtEpiceaExplicitLog on: entries.
]

{ #category : #accessing }
GtEpiceaAbstractLog >> shouldUpdate [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> timeAt: anEpEvent [ 
	^ self subclassResponsibility
]
