Class {
	#name : #GtEpHistoryGroupingExamples,
	#superclass : #Object,
	#instVars : [
		'theLogBuilder',
		'theMonitor',
		'theCodeFactory'
	],
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #setup }
GtEpHistoryGroupingExamples >> classFactory [
	^ self codeFactory classFactory
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> codeFactory [ 
	self ensureSetup.
	^ theCodeFactory
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> createAndMoveClassToDifferentTag [
	<gtExample>
	<after: #tearDown>
	| newClass |
	
	self packageFactory 
		createNewPackageNamed: self mainPackageNameForTesting;
		createNewTagNamed: 'TagA' 
		inPackageNamed: self mainPackageNameForTesting.
	self packageFactory 
		createNewPackageNamed: self secondaryPackageNameForTesting;
		createNewTagNamed: 'TagA' 
		inPackageNamed: self secondaryPackageNameForTesting.
	
	newClass := self classFactory 
		newClassInPackageNamed: self mainPackageNameForTesting 
		withTagNamed: 'TagA'.
	
	self classFactory 
		redefineClass: newClass 
		inPackageNamed: self secondaryPackageNameForTesting
		withTagName: 'TagA'.
	
	^ GtEpiceaEntriesGroup withAll:theMonitor log entries
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
	
	theCodeFactory := GtEpiceaCodeFactoryForTesting new.
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> mainPackageNameForTesting [

	^ #'CategoryForTestToBeDeleted'
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> packageFactory [
	^ self codeFactory packageFactory
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> secondaryPackageNameForTesting [

	^ #'CategoryForTestToBeDeleted-Second'
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> tearDown [
	self inform: 'terminating'.
	
	theMonitor disable.	
	theCodeFactory cleanUp.
	theLogBuilder cleanUp.
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> testClassAndMethodEventsWithNoImpactByMethod [
	<gtExample>
	| entries methodHistories |
	entries := self createClassAndMethodEventsWithNoImpact.
	methodHistories := entries methodHistories.
	
	self assert: methodHistories hasNoEffect.
	
	^ methodHistories
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> testClassMoveBetweenPackagesWithByPackageGrouping [
	<gtExample>
	| entries packageHistories mainPackageHistory |
	entries := self createAndMoveClassToDifferentTag.
	packageHistories := entries packageHistories.
	
	self assert: packageHistories hasNoEffect not.
	
	mainPackageHistory := packageHistories 
		historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect.
	
	^ packageHistories
]
