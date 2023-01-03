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

{ #category : #accessing }
GtEpHistoryGroupingExamples >> classFactory [
	^ self codeFactory classFactory
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> codeFactory [ 
	self ensureSetup.
	^ theCodeFactory
]

{ #category : #'events generation' }
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
GtEpHistoryGroupingExamples >> createMethodEventsWithNoImpactInNewClass [
	<gtExample>
	<after: #tearDown>
	| newClass |

	newClass := self classFactory newClass.
	
	newClass compile: 'fortyTwo ^42'.
	newClass compile: 'fortyTwo ^40+1'.
	(newClass methodNamed: #fortyTwo) protocol: 'new-protocol' .
	newClass removeSelector: #fortyTwo.
	
	newClass compile: 'fortyThree ^43'.
	newClass removeSelector: #fortyThree.
	
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

{ #category : #accessing }
GtEpHistoryGroupingExamples >> mainPackageNameForTesting [

	^ #'CategoryForTestToBeDeleted-Default'
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> packageFactory [
	^ self codeFactory packageFactory
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> secondaryPackageNameForTesting [

	^ #'CategoryForTestToBeDeleted-Second'
]

{ #category : #setup }
GtEpHistoryGroupingExamples >> tearDown [
	theMonitor disable.	
	theCodeFactory cleanUp.
	theLogBuilder cleanUp.
]

{ #category : #examples }
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

{ #category : #examples }
GtEpHistoryGroupingExamples >> testMethodEventsWithNoImpactInNewClass [
	<gtExample>
	| entries methodHistories |
	entries := self createMethodEventsWithNoImpactInNewClass.
	methodHistories := entries methodHistories.
	
	self assert: methodHistories hasNoEffect.
	self assert: methodHistories size equals: 2.
	
	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testTransformMethodToExtensionMethodEventsGrouping [
	<gtExample>
	
	| entries packageHistories mainPackageHistory secondPackageHistory methodHistoryInMainPackage methodHistoryInSecondPackage |
	entries := self transformMethodToExtensionMethodEvents.
	packageHistories := entries packageHistories.
	
	self assert: packageHistories hasNoEffect not.
	self assert: packageHistories size equals: 2.
	
	mainPackageHistory := packageHistories 
		historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not.
	
	secondPackageHistory := packageHistories 
		historyForPackageNamed: self secondaryPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not.
	
	methodHistoryInMainPackage := mainPackageHistory classHistories first methodHistories first.
	self assert: methodHistoryInMainPackage hasNoEffect.
	self assert: methodHistoryInMainPackage changes size equals: 2.
	self assert: methodHistoryInMainPackage isInitialChangeAddition.
	self assert: methodHistoryInMainPackage isLatestChangeRemoval.
	
	methodHistoryInSecondPackage := secondPackageHistory classHistories first methodHistories first.
	self assert: methodHistoryInSecondPackage hasNoEffect not.
	self assert: methodHistoryInSecondPackage changes size equals: 1.
	self assert: methodHistoryInSecondPackage isInitialChangeAddition.
	self assert: methodHistoryInSecondPackage isLatestChangeRemoval not.
	
	^ entries
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> transformMethodToExtensionMethodEvents [
	<gtExample>
	<after: #tearDown>
	| newClass |
	
	newClass := self classFactory newClass.
	newClass compile: 'fortyTwo ^42'.

	self packageFactory 
		createNewPackageNamed: self secondaryPackageNameForTesting.
	
	(newClass methodNamed: #fortyTwo) protocol: '*', self secondaryPackageNameForTesting.
	
	^ GtEpiceaEntriesGroup withAll:theMonitor log entries
]
