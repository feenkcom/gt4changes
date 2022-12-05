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
GtEpiceaAbstractLog >> entriesStream [
	^ self subclassResponsibility
]

{ #category : #'accessing - grouping' }
GtEpiceaAbstractLog >> groupedByMethod [
	^ ((self entries 
		select: [ :anOmbuEntry |
			anOmbuEntry content isEpMethodChange ])
		groupedBy: [ :anOmbuEntry | anOmbuEntry content methodAffected ]) associations 
		collect: [ :assoc | GtEpiceaMethodHistory new 
			targetMethod: assoc key;
			changes: (GtEpiceaEntriesGroup 
				withAll: (assoc value 
					sorted: [ :anEntry | anEntry gtTime] descending ) ) ] 
]

{ #category : #accessing }
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
				GtEpiceaApplyChangesDetailsElement  new 
					entries: changeListModel selectedCodeEvents;
					anchor: aButton ].

	self addToolbarButtonsTo: view withModel: changeListModel.

	^ view
]

{ #category : #accessing }
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

{ #category : #accessing }
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
GtEpiceaAbstractLog >> gtViewGroupedByMethodFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView columnedTree 
		title: 'By Method';
		priority: 20;
		items: [ self groupedByMethod 
			sorted: [ :assoc | 
				assoc value latestChange gtTime] descending ];
		children: [ :anEntry |
			anEntry class = GtEpiceaMethodHistory 
				ifTrue: [ anEntry changes ]
				ifFalse: [ #() ] ];
		column: 'Type ' do: [ :aColumn | 
			aColumn 
				width: 55;
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal alignCenter;
					padding: (BlInsets left:10);
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical fitContent ] ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChild: (anEntry class = GtEpiceaMethodHistory 
							ifTrue: [ anEntry latestChange content accept: EpIconVisitor new ]
							ifFalse: [ anEntry content accept: EpIconVisitor new ]) asElement ] ];
		column: 'Method' do: [ :aColumn |
			aColumn 
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: 26 ] ];
				dataBinder: [ :anElement :anEntry | 
					| ombuEntity |
					ombuEntity := anEntry class = GtEpiceaMethodHistory 
						ifTrue: [ anEntry latestChange ]
						ifFalse: [ anEntry ].
					anElement
						removeChildren;
						addChildren: (ombuEntity content 
							accept: GtEpiceaBrickVisitor new) ] ]; 
		column: 'Changes Count' text: [ :anEntry | 
			anEntry class = GtEpiceaMethodHistory 
				ifTrue: [ 
					anEntry changes size asString
						, ' '
						, ('change' asPluralBasedOn: anEntry changes size) ] 
				ifFalse: [ '' ] ] width: 100;
		column: 'Timestamp' text: [ :anEntry | 
			(anEntry class = GtEpiceaMethodHistory 
				ifTrue: [ 
					anEntry latestChange gtTime ] 
				ifFalse: [ anEntry gtTime ]) printToSeconds ] width: 150
]

{ #category : #accessing }
GtEpiceaAbstractLog >> headReference [

	^ headReference ifNil: 
		[ headReference := (self orderEntries: self entries) first tagAt: #self ].
]

{ #category : #accessing }
GtEpiceaAbstractLog >> historyFilter [
	"Filter the events down to only those that were present in the system  at the time of the latest change and which would change the current system (i.e. need to be applied).
	This works across multiple log files in the event that an old image is being used to recover changes."
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
	"Filter the events down to only those that were present in the system  at the time of the latest change and which would change the current system (i.e. need to be applied).
	This works across multiple log files in the event that an old image is being used to recover changes."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | sorted |
			sorted := GtEpEventSequencer 
				sequence: (GtEpiceaExplicitLog on: aStream toArray wait) priorEntriesFromHead 
				withCurrent: false.
			AsyncSequenceStream forCollection: sorted reversed ];
		named: 'Recover';
		order: 20;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> sequenceFilter [
	"Filter the events down to only those that were present in the system  at the time of the latest change and which would change the current system (i.e. need to be applied).
	This works across multiple log files in the event that an old image is being used to recover changes."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | chronological sorted |
			chronological := GtEpEventSequencer new
				chronologicalEntriesFrom: aStream toArray wait.
			sorted := GtEpEventSequencer new 
				sortedEntriesFrom: chronological.
			AsyncSequenceStream forCollection: sorted reversed ];
		named: 'Sequence';
		order: 20;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> shouldUpdate [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> timeAt: anEpEvent [ 
	^ self subclassResponsibility
]
