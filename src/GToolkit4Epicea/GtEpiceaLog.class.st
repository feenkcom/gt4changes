Class {
	#name : #GtEpiceaLog,
	#superclass : #GtEpiceaAbstractLog,
	#instVars : [
		'log',
		'frozen'
	],
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #'instance creation' }
GtEpiceaLog class >> allInSessionStore [
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
GtEpiceaLog >> addEntryWith: anEntry tags: aTagsBlock [

	self isFrozen ifTrue: [ 
		self error: 'Cannot add to frozen change set.' ].
	^ self log addEntryWith: anEntry tags: aTagsBlock
]

{ #category : #accessing }
GtEpiceaLog >> additionFilter [
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
GtEpiceaLog >> endTime [
	^ self log endTime
]

{ #category : #accessing }
GtEpiceaLog >> entries [
	^  self log entries
]

{ #category : #accessing }
GtEpiceaLog >> entriesStream [
	^ self log entriesStream
]

{ #category : #accessing }
GtEpiceaLog >> freeze [

	self isActive ifTrue: [ 
		self error: 'Cannot freeze an active change set.' ].
	frozen := true
]

{ #category : #accessing }
GtEpiceaLog >> gtChildren [
	^ #()
]

{ #category : #accessing }
GtEpiceaLog >> initialize [
	frozen := false
]

{ #category : #accessing }
GtEpiceaLog >> isActive [
	^ EpMonitor current log store globalName = self name
]

{ #category : #accessing }
GtEpiceaLog >> isFrozen [
	^ frozen
]

{ #category : #accessing }
GtEpiceaLog >> latestFilter [
	<gtChangeFilter>
	^ GtFilterDescriptor new
		creator: [ :aStream | aStream withoutDuplicatesBasedOn: [ :aChange | aChange content affectedMarker ] ];
		named: 'Latest';
		order: 12;
		valueNotRequired;
		beNotDefault
]

{ #category : #accessing }
GtEpiceaLog >> log [
	^ log
]

{ #category : #accessing }
GtEpiceaLog >> log: aLog [
	log := aLog
]

{ #category : #accessing }
GtEpiceaLog >> name [
	^ log store globalName
]

{ #category : #accessing }
GtEpiceaLog >> ombuFile: aFile [
	self log: (EpLog fromFile: aFile)
]

{ #category : #accessing }
GtEpiceaLog >> shouldUpdate [
	^ self isActive
]

{ #category : #accessing }
GtEpiceaLog >> startTime [

	^ self log startTime
]

{ #category : #accessing }
GtEpiceaLog >> store [
	^ self log store
]

{ #category : #accessing }
GtEpiceaLog >> thaw [
	frozen := false
]

{ #category : #accessing }
GtEpiceaLog >> timeAt: anEvent [
	^ self log timeAt: anEvent
]
