Class {
	#name : #GtEpiceaLog,
	#superclass : #Object,
	#instVars : [
		'log'
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
GtEpiceaLog >> endTime [
	^ self log endTime
]

{ #category : #accessing }
GtEpiceaLog >> gtEventsFor: aView [

	<gtView>
	<gtViewChanges>
	| view |
	view := aView columnedList
		        title: 'Change List';
		        priority: 3;
		        itemsProvider: [ self log entriesStream ];
		        column: 'Icon' icon: [ :anEpEvent :anIndex | 
			        (anEpEvent content accept: EpIconVisitor new) asElement ]
		        width: 32;
		        column: 'Description' stencil: [ :anEpEvent :anIndex | 
			        BlElement new
				        layout: BlLinearLayout horizontal;
				        addChildren:
					        (anEpEvent content accept: GtEpiceaBrickVisitor new);
				        constraintsDo: [ :c | 
					        c horizontal fitContent.
					        c vertical fitContent ] ];
		        column: 'Timestamp'
		        text: [ :anEpEvent :anIndex | log timeAt: anEpEvent ];
		        actionButtonLabel: 'Show Latest'
		        action: [ :aButton :aTab | 
			        aTab viewContentElement children first children second 
				        itemsProvider:
				        (self log entriesStream withoutDuplicatesBasedOn: self latestFilter)
					        asBrItemsProvider ].
	^ view
]

{ #category : #accessing }
GtEpiceaLog >> latestFilter [

	^ [ :aChange | aChange content affectedMarker]
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
GtEpiceaLog >> startTime [

	^ self log startTime
]
