Class {
	#name : #GtEpiceaLog,
	#superclass : #GtEpiceaAbstractLog,
	#instVars : [
		'log'
	],
	#category : #'GToolkit4Epicea-Model'
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
GtEpiceaLog >> endTime [
	^ self log endTime
]

{ #category : #accessing }
GtEpiceaLog >> entries [
	^ log ifNil: [ {} ] ifNotNil: [ self log entries ]
]

{ #category : #accessing }
GtEpiceaLog >> entriesStream [
	^ log ifNil: [ AsyncEmptyStream new ] ifNotNil: [ log entriesStream ]
]

{ #category : #accessing }
GtEpiceaLog >> gtChildren [
	^ #()
]

{ #category : #accessing }
GtEpiceaLog >> isActive [
	^ EpMonitor current log store globalName = self name
]

{ #category : #accessing }
GtEpiceaLog >> isComposite [
	^ false
]

{ #category : #accessing }
GtEpiceaLog >> isSimple [
	^ true
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
	^ log ifNil: [ '' ] ifNotNil: [ log store globalName ]
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
GtEpiceaLog >> timeAt: anEvent [
	^ self log timeAt: anEvent
]
