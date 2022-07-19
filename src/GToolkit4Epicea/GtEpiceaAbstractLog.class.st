Class {
	#name : #GtEpiceaAbstractLog,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #accessing }
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
GtEpiceaAbstractLog >> isActive [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> isFrozen [
	^ self subclassResponsibility
]

{ #category : #accessing }
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
GtEpiceaAbstractLog >> orderEvents: aCollectionOfEvents [
	^ (aCollectionOfEvents sorted: [:a :b | (self timeAt: a) > (self timeAt: b)]) collect: #content
]

{ #category : #accessing }
GtEpiceaAbstractLog >> timeAt: anEpEvent [ 
	^ self subclassResponsibility
]