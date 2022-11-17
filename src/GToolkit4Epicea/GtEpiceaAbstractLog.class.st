Class {
	#name : #GtEpiceaAbstractLog,
	#superclass : #Object,
	#instVars : [
		'frozen'
	],
	#category : #'GToolkit4Epicea-Model'
}

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

{ #category : #'gt - extensions' }
GtEpiceaAbstractLog >> freeze [

	self isActive ifTrue: [ 
		self error: 'Cannot freeze an active change set.' ].
	frozen := true
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
			stencil: [ (GtEpiceaChangeListElement forModel: changeListModel) padding: (BlInsets top: 5)].

	(self isFrozen or: [ self isActive ])
		ifFalse: [ view
				actionDropdownButtonIcon: BrGlamorousVectorIcons add
				tooltip: 'Add Selected Changes'
				content: [ :aButton | 
					(GtEpiceaAddAction new
						log: self;
						anchor: aButton;
						events: EpMonitor current log entries) asDropdown ] ].

	view
		actionDropdownButtonLabel: 'Apply'
			tooltip: 'Apply Selected Changes'
			content: [ :aButton | 
				(GtEpiceaApplyAction on: (self orderEvents: changeListModel selectedCodeEvents))
					anchor: aButton;
					asDropdown ];
		actionDropdownButtonLabel: 'Revert'
			tooltip: 'Revert Selected Changes'
			content: [ :aButton | 
				(GtEpiceaRevertAction on: (self orderEvents: changeListModel selectedCodeEvents))
					anchor: aButton;
					asDropdown ].



	^ view
]

{ #category : #accessing }
GtEpiceaAbstractLog >> gtImpactFor: aView [
	<gtView>
	^ aView explicit
		title: 'Impact';
		priority: 1;
		stencil: [ (GtEpiceaShowAction on: self entries) asViewFor: self ]
]

{ #category : #accessing }
GtEpiceaAbstractLog >> historyFilter [
	"Filter the events down to only those that were present in the system  at the time of the latest change and which would change the current system (i.e. need to be applied).
	This works across multiple log files in the event that an old image is being used to recover changes."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | epLog |
			epLog := GtEpLogEnumerator new latestLog: self logs first.
			AsyncSequenceStream forCollection: epLog priorEntriesFromHead ];
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

{ #category : #accessing }
GtEpiceaAbstractLog >> isFrozen [
	^ frozen
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
GtEpiceaAbstractLog >> orderEvents: aCollectionOfEvents [
	^ (aCollectionOfEvents sorted: [:a :b | (self timeAt: a) > (self timeAt: b)]) collect: #content
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

{ #category : #accessing }
GtEpiceaAbstractLog >> recoverFilter [
	"Filter the events down to only those that were present in the system  at the time of the latest change and which would change the current system (i.e. need to be applied).
	This works across multiple log files in the event that an old image is being used to recover changes."
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | | epLog sorted |
			epLog := GtEpLogEnumerator new latestLog: self logs first.
			sorted := GtEpEventSequencer uniqueInstance 
				sequence: epLog priorEntriesFromHead withCurrent: false.
			AsyncSequenceStream forCollection: sorted ];
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
			chronological := GtEpEventSequencer uniqueInstance
				chronologicalEntriesFrom: aStream toArray wait.
			sorted := GtEpEventSequencer uniqueInstance 
				sortedEntriesFrom: chronological.
			AsyncSequenceStream forCollection: sorted reversed ];
		named: 'Sequence';
		order: 20;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaAbstractLog >> thaw [
	frozen := false
]

{ #category : #accessing }
GtEpiceaAbstractLog >> timeAt: anEpEvent [ 
	^ self subclassResponsibility
]
