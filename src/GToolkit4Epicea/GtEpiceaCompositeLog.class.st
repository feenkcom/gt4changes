Class {
	#name : #GtEpiceaCompositeLog,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #accessing }
GtEpiceaCompositeLog class >> forAllInSessionStore [
	<script>
	| monitor directory currentGlobalName |
	monitor := EpMonitor current.
	directory := monitor sessionStore baseLocator.
	currentGlobalName := monitor sessionStore store globalName.
	^ self onLogs: ((EpFileLogNode fromAllLogsIn: directory)
		sort: [ :a :b | a modificationTime >= b modificationTime ];
		collect: [ :n | 
			| node |
			node := n globalName = currentGlobalName
				ifTrue: [ EpMonitorLogNode for: monitor ]
				ifFalse: [ n ].
			node log ])
]

{ #category : #accessing }
GtEpiceaCompositeLog class >> onLogs: aCollectionOfLogs [
	^ self new
		logs: aCollectionOfLogs
	
]

{ #category : #accessing }
GtEpiceaCompositeLog >> allInSessionStore [
	<script>
	| monitor directory currentGlobalName |
	monitor := EpMonitor current.
	directory := monitor sessionStore baseLocator.
	currentGlobalName := monitor sessionStore store globalName.
	^ self onLogs: ((EpFileLogNode fromAllLogsIn: directory)
		sort: [ :a :b | a modificationTime >= b modificationTime ];
		collect: [ :n | 
			| node |
			node := n globalName = currentGlobalName
				ifTrue: [ EpMonitorLogNode for: monitor ]
				ifFalse: [ n ].
			node log ])
]

{ #category : #accessing }
GtEpiceaCompositeLog >> entries [
		^ self logs flatCollect: #entries
]

{ #category : #accessing }
GtEpiceaCompositeLog >> entriesStream [
	^ (self logs collect: #entriesStream) flatten
]

{ #category : #accessing }
GtEpiceaCompositeLog >> gtChildren [
	^ self logs collect: [:aLog | GtEpiceaLog new log: aLog]
]

{ #category : #accessing }
GtEpiceaCompositeLog >> isActive [
	^ false
]

{ #category : #accessing }
GtEpiceaCompositeLog >> isFrozen [
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
GtEpiceaCompositeLog >> onLogs: aCollectionOfLogs [
	^ self new
		logs: aCollectionOfLogs
	
]

{ #category : #accessing }
GtEpiceaCompositeLog >> startTime [
	^ self logs first startTime
]

{ #category : #accessing }
GtEpiceaCompositeLog >> timeAt: anEntry [
		^ (self logs detect: [:aLog | (aLog timeAt: anEntry ifAbsent: [ nil ]) isNotNil ]) timeAt: anEntry
]
