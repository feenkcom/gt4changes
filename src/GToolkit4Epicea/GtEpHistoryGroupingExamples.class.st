Class {
	#name : #GtEpHistoryGroupingExamples,
	#superclass : #Object,
	#instVars : [
		'theLogBuilder',
		'theMonitor',
		'theClassFactory'
	],
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #setup }
GtEpHistoryGroupingExamples >> classFactory [
	self ensureSetup.
	^ theClassFactory
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> createClassAndMethodEventsWithNoImpact [
	<gtExample>
	<after: #tearDown>
	| aClass |

	aClass := self classFactory newClass.
	
	aClass compile: 'fortyTwo ^42'.
	aClass compile: 'fortyTwo ^40+1'.
	(aClass methodNamed: #fortyTwo) protocol: 'new-protocol' .
	aClass removeSelector: #fortyTwo.
	
	aClass compile: 'fortyThree ^43'.
	aClass removeSelector: #fortyThree.
	
	^ GtEpiceaEntriesGroup withAll:theMonitor log entries
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> ensureSetup [ 
	theLogBuilder ifNotNil: [ ^ self ].
	
	theLogBuilder := EpTestLogBuilder new
		useLogWithSessionStore;
		yourself.
	theMonitor := EpMonitor newWithLog: theLogBuilder log.
	theMonitor enable.
	
	theClassFactory := ClassFactoryForTestCase new.
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> groupClassAndMethodEventsWithNoImpactByMethod [
	<gtExample>
	| entries methodHistories |
	entries := self createClassAndMethodEventsWithNoImpact.
	methodHistories := entries methodHistories.
	
	self assert: methodHistories hasNoEffect.
	
	^ methodHistories
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> tearDown [

	theMonitor disable.	
	theClassFactory cleanUp.
	theLogBuilder cleanUp.
]
