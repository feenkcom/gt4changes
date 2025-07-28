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
	<return: #GtEpiceaEntriesGroup>
	| newClass |
	self packageFactory
		createNewPackageNamed: self mainPackageNameForTesting;
		createNewTagNamed: 'TagA' inPackageNamed: self mainPackageNameForTesting.
	self packageFactory
		createNewPackageNamed: self secondaryPackageNameForTesting;
		createNewTagNamed: 'TagA' inPackageNamed: self secondaryPackageNameForTesting.

	newClass := self classFactory
			newClassInPackageNamed: self mainPackageNameForTesting
			withTagNamed: 'TagA'.

	self classFactory
		redefineClass: newClass
		inPackageNamed: self secondaryPackageNameForTesting
		withTagName: 'TagA'.

	^ GtEpiceaEntriesGroup withAll: theMonitor log entries
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> createAndRemoveClassWithMethodEvents [
	<gtExample>
	<after: #tearDown>
	<return: #GtEpiceaEntriesGroup>
	| newClass |
	newClass := self classFactory newClass.

	newClass compile: 'fortyTwo ^42'.
	newClass removeSelector: #fortyTwo.

	newClass compile: 'fortyThree ^43'.

	newClass removeFromSystem.

	^ GtEpiceaEntriesGroup withAll: theMonitor log entries
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> createMethodEventsWithNoImpactInNewClass [
	<gtExample>
	<after: #tearDown>
	<return: #GtEpiceaEntriesGroup>
	| newClass |
	newClass := self classFactory newClass.

	newClass compile: 'fortyTwo ^42'.
	newClass compile: 'fortyTwo ^40+1'.
	(newClass methodNamed: #fortyTwo) protocol: 'new-protocol'.
	newClass removeSelector: #fortyTwo.

	newClass compile: 'fortyThree ^43'.
	newClass removeSelector: #fortyThree.

	^ GtEpiceaEntriesGroup withAll: theMonitor log entries
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

	^ self 
		forPharo12: [ #'CategoryForTestToBeDeleted' ]
		forPharo11AndPharo10: [ #'CategoryForTestToBeDeleted-Default' ]
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> moveExtensionMethodBetweetPackagesEvents [
	<gtExample>
	<after: #tearDown>
	<return: #GtEpiceaEntriesGroup>
	| newClass |
	newClass := self classFactory newClass.
	newClass compile: 'fortyTwo ^42'.

	self packageFactory createNewPackageNamed: self secondaryPackageNameForTesting.
	self packageFactory createNewPackageNamed: self thirdPackageNameForTesting.

	(newClass methodNamed: #fortyTwo)
		protocol: '*' , self secondaryPackageNameForTesting.
	(newClass methodNamed: #fortyTwo)
		protocol: '*' , self thirdPackageNameForTesting.

	^ GtEpiceaEntriesGroup withAll: theMonitor log entries
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
	<return: #GtEpiceaPackageHistoriesGroup>
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
GtEpHistoryGroupingExamples >> testCreateAndRemoveClassWithMethodEventsGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	| entries methodHistories classHistories packageHistories |
	entries := self createAndRemoveClassWithMethodEvents.

	methodHistories := entries methodHistories.
	classHistories := entries classHistories.
	packageHistories := entries classHistories.

	self assert: methodHistories hasNoEffect.
	self assert: methodHistories size equals: 2.

	self assert: classHistories hasNoEffect.
	self assert: classHistories size equals: 1.

	self assert: packageHistories hasNoEffect.
	self assert: packageHistories size equals: 1.

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testMethodEventsWithNoImpactInNewClass [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	| entries methodHistories classHistories packageHistories |
	entries := self createMethodEventsWithNoImpactInNewClass.

	methodHistories := entries methodHistories.
	classHistories := entries classHistories.
	packageHistories := entries classHistories.

	self assert: methodHistories hasNoEffect.
	self assert: methodHistories size equals: 2.

	self assert: classHistories hasEffect.
	self assert: classHistories size equals: 1.
	self assert: classHistories methodHistories hasNoEffect.

	self assert: packageHistories hasEffect.
	self assert: packageHistories size equals: 1.

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testMoveExtensionMethodBetweetPackagesByPackageGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	| entries packageHistories mainPackageHistory secondPackageHistory methodHistoryInMainPackage methodHistoryInSecondPackage thirdPackageHistory methodHistoryInThirdPackage |
	entries := self moveExtensionMethodBetweetPackagesEvents.
	packageHistories := entries packageHistories.

	self assert: packageHistories hasNoEffect not.
	self assert: packageHistories size equals: 3.

	mainPackageHistory := packageHistories
			historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not.

	secondPackageHistory := packageHistories
			historyForPackageNamed: self secondaryPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not.

	thirdPackageHistory := packageHistories
			historyForPackageNamed: self thirdPackageNameForTesting.
	self assert: thirdPackageHistory hasNoEffect not.

	methodHistoryInMainPackage := mainPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInMainPackage hasNoEffect.
	self assert: methodHistoryInMainPackage changes size equals: 2.
	self assert: methodHistoryInMainPackage isInitialChangeAddition.
	self assert: methodHistoryInMainPackage isLatestChangeRemoval.

	methodHistoryInSecondPackage := secondPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInSecondPackage hasNoEffect.
	self assert: methodHistoryInSecondPackage changes size equals: 2.
	self assert: methodHistoryInSecondPackage isInitialChangeAddition.
	self assert: methodHistoryInSecondPackage isLatestChangeRemoval.

	methodHistoryInThirdPackage := thirdPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInThirdPackage hasNoEffect not.
	self assert: methodHistoryInThirdPackage changes size equals: 1.
	self assert: methodHistoryInThirdPackage isInitialChangeAddition.
	self assert: methodHistoryInThirdPackage isLatestChangeRemoval not.

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testTransformMethodToExtensionMethodWithByPackageGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
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

	methodHistoryInMainPackage := mainPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInMainPackage hasNoEffect.
	self assert: methodHistoryInMainPackage changes size equals: 2.
	self assert: methodHistoryInMainPackage isInitialChangeAddition.
	self assert: methodHistoryInMainPackage isLatestChangeRemoval.

	methodHistoryInSecondPackage := secondPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInSecondPackage hasNoEffect not.
	self assert: methodHistoryInSecondPackage changes size equals: 1.
	self assert: methodHistoryInSecondPackage isInitialChangeAddition.
	self assert: methodHistoryInSecondPackage isLatestChangeRemoval not.

	^ entries
]

{ #category : #accessing }
GtEpHistoryGroupingExamples >> thirdPackageNameForTesting [

	^ #'CategoryForTestToBeDeleted-Third'
]

{ #category : #'events generation' }
GtEpHistoryGroupingExamples >> transformMethodToExtensionMethodEvents [
	<gtExample>
	<after: #tearDown>
	<return: #GtEpiceaEntriesGroup>
	| newClass |
	newClass := self classFactory newClass.
	newClass compile: 'fortyTwo ^42'.

	self packageFactory createNewPackageNamed: self secondaryPackageNameForTesting.

	(newClass methodNamed: #fortyTwo)
		protocol: '*' , self secondaryPackageNameForTesting.

	^ GtEpiceaEntriesGroup withAll: theMonitor log entries
]
