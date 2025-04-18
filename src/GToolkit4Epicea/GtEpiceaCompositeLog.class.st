Class {
	#name : #GtEpiceaCompositeLog,
	#superclass : #GtEpiceaAbstractLog,
	#instVars : [
		'logs'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaCompositeLog class >> allInSessionStore [
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
			node log ]
]

{ #category : #accessing }
GtEpiceaCompositeLog class >> allInStore: aDirectory [
	^ (EpFileLogNode fromAllLogsIn: aDirectory)
		sort: [ :a :b | a modificationTime >= b modificationTime ];
		collect: #log
]

{ #category : #accessing }
GtEpiceaCompositeLog class >> forAllInSessionStore [
	^ self onLogs: self allInSessionStore
]

{ #category : #accessing }
GtEpiceaCompositeLog class >> forAllInStore: aDirectory [
	^ self onLogs: (self allInStore: aDirectory)
]

{ #category : #accessing }
GtEpiceaCompositeLog class >> onLogs: aCollectionOfLogs [
	^ self new
		logs: aCollectionOfLogs
	
]

{ #category : #accessing }
GtEpiceaCompositeLog >> createListFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Log files';
		items: [ {self} ];
		children: #gtChildren;
		column: 'Name' text: [ :change | change name ];
		column: 'Active'
			stencil: [ :item | 
				item isActive
					ifTrue: [ BlElement new
							background: BrGlamorousColors selectedListItemColor;
							aptitude: (BrGlamorousWithExplicitTooltipAptitude text: 'Active');
							size: 12 @ 12;
							geometry: (BlRoundedRectangleGeometry cornerRadius: 6);
							margin: (BlInsets left: 14) ]
					ifFalse: [ BlElement new size: 12 @ 12 ] ]
			width: 38;
		column: 'From' text: [ :change | 
			change startTime
				ifNil: [ '-' ] 
				ifNotNil: [ :aDateAndTime | 
					aDateAndTime printToSeconds ] ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Reload list of changes'
			action: [ :aButton :aTab | 
				self recompute.
				aTab viewContentElement phlow update ]
]

{ #category : #accessing }
GtEpiceaCompositeLog >> entries [
		^ self logs flatCollect: #entries
]

{ #category : #accessing }
GtEpiceaCompositeLog >> entriesStream [
	^ (AsyncSequenceStream forCollection: (self logs reverse collect: #entriesStream))
		flatten
]

{ #category : #accessing }
GtEpiceaCompositeLog >> gtChildren [
	^ self logs collect: [:aLog | GtEpiceaLog new log: aLog]
]

{ #category : #initialization }
GtEpiceaCompositeLog >> initialize [
	super initialize.
	logs := OrderedCollection new
]

{ #category : #accessing }
GtEpiceaCompositeLog >> isActive [
	^ false
]

{ #category : #accessing }
GtEpiceaCompositeLog >> isComposite [
	^ true
]

{ #category : #accessing }
GtEpiceaCompositeLog >> isSimple [
	^ false
]

{ #category : #accessing }
GtEpiceaCompositeLog >> logs [
	^ logs
]

{ #category : #accessing }
GtEpiceaCompositeLog >> logs: aCollectionOfLogs [ 
	logs := aCollectionOfLogs
]

{ #category : #accessing }
GtEpiceaCompositeLog >> name [
	^ self logs size asString, ' logs'
]

{ #category : #accessing }
GtEpiceaCompositeLog >> recompute [
	^ self logs: self class allInSessionStore
]

{ #category : #accessing }
GtEpiceaCompositeLog >> shouldUpdate [
	^ logs anySatisfy: [:log | EpMonitor current log store globalName = log store globalName ]
]

{ #category : #accessing }
GtEpiceaCompositeLog >> startTime [
	^ self logs ifEmpty: [ nil ] ifNotEmpty: [ :logCollection | logCollection last startTime ]
]

{ #category : #accessing }
GtEpiceaCompositeLog >> timeAt: anEntry [
		^ (self logs detect: [:aLog | (aLog timeAt: anEntry ifAbsent: [ nil ]) isNotNil ]) timeAt: anEntry
]
