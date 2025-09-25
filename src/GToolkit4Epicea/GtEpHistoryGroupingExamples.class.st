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
	<shouldLogWithEpicea>
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

{ #category : #examples }
GtEpHistoryGroupingExamples >> descriptionMessage: aString histories: aCollection [

	^ String streamContents: [ :stream |
		stream
			<< aString; cr;
			<< 'Histories:'; cr.
		aCollection do: [ :history |
			stream print: history; cr.
			history entries do: [ :entry |
				stream tab; print: entry content; cr ] ] ]
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
		forPharo12AndNewer: [ #'CategoryForTestToBeDeleted' ]
		forPharo11: [ #'CategoryForTestToBeDeleted-Default' ]
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

	(self mainPackageNameForTesting asPackageIfAbsent: [])
		ifNotNil: [ :package | package removeFromSystem ].
	(self secondaryPackageNameForTesting asPackageIfAbsent: [])
		ifNotNil: [ :package | package removeFromSystem ].
	theMonitor disable.	
	theCodeFactory cleanUp.
	theLogBuilder cleanUp.
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testClassMoveBetweenPackagesWithByPackageGrouping [
	<gtExample>
	<return: #GtEpiceaPackageHistoriesGroup>
	<shouldLogWithEpicea>
	| entries packageHistories mainPackageHistory |

	entries := self createAndMoveClassToDifferentTag.
	packageHistories := entries packageHistories.

	self assert: packageHistories hasNoEffect not
		description: [ self descriptionMessage: 'packageHistories hasNoEffect not' histories: packageHistories items ].

	mainPackageHistory := packageHistories
			historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect
		description: [ self descriptionMessage: 'mainPackageHistory hasNoEffect' histories: { mainPackageHistory } ].

	^ packageHistories
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testCreateAndRemoveClassWithMethodEventsGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	<shouldLogWithEpicea>
	| entries methodHistories classHistories packageHistories |
	entries := self createAndRemoveClassWithMethodEvents.

	methodHistories := entries methodHistories.
	classHistories := entries classHistories.
	packageHistories := entries classHistories.

	self assert: methodHistories hasNoEffect
		description: [ self descriptionMessage: 'methodHistories hasNoEffect' histories: methodHistories items ].
	self assert: methodHistories size = 2
		description: [ self descriptionMessage: 'methodHistories size = 2' histories: methodHistories items ].

	self assert: classHistories hasNoEffect
		description: [ self descriptionMessage: 'classHistories hasNoEffect' histories: classHistories items ].
	self assert: classHistories size = 1
		description: [ self descriptionMessage: 'classHistories size = 1' histories: classHistories items ].

	self assert: packageHistories hasNoEffect
		description: [ self descriptionMessage: 'packageHistories hasNoEffect' histories: packageHistories items ].
	self assert: packageHistories size = 1
		description: [ self descriptionMessage: 'packageHistories size = 1' histories: packageHistories items ].

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testMethodEventsWithNoImpactInNewClass [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	<shouldLogWithEpicea>
	| entries methodHistories classHistories packageHistories |
	entries := self createMethodEventsWithNoImpactInNewClass.

	methodHistories := entries methodHistories.
	classHistories := entries classHistories.
	packageHistories := entries classHistories.

	self assert: methodHistories hasNoEffect
		description: [ self descriptionMessage: 'methodHistories hasNoEffect' histories: methodHistories items ].
	self assert: methodHistories size = 2
		description: [ self descriptionMessage: 'methodHistories size = 2' histories: methodHistories items ].

	self assert: classHistories hasEffect
		description: [ self descriptionMessage: 'classHistories hasEffect' histories: classHistories items ].
	self assert: classHistories size = 1
		description: [ self descriptionMessage: 'classHistories size = 1' histories: classHistories items ].
	self assert: classHistories methodHistories hasNoEffect
		description: [ self descriptionMessage: 'classHistories methodHistories hasNoEffect' histories: classHistories methodHistories items ].

	self assert: packageHistories hasEffect
		description: [ self descriptionMessage: 'packageHistories hasEffect' histories: packageHistories items ].
	self assert: packageHistories size = 1
		description: [ self descriptionMessage: 'packageHistories size = 1' histories: packageHistories items ].

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testMoveExtensionMethodBetweetPackagesByPackageGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	<shouldLogWithEpicea>
	| entries packageHistories mainPackageHistory secondPackageHistory methodHistoryInMainPackage methodHistoryInSecondPackage thirdPackageHistory methodHistoryInThirdPackage expectedSize |
	entries := self moveExtensionMethodBetweetPackagesEvents.
	packageHistories := entries packageHistories.

	self assert: packageHistories hasNoEffect not
		description: [ self descriptionMessage: 'packageHistories hasNoEffect not' histories: packageHistories items ].
	"packageHistories would normally contain 3 entries.
	Due to https://github.com/feenkcom/gtoolkit/issues/4734 it currently contains an unpackage entry as well in Pharo12."
	expectedSize := self forPharo12AndNewer: [3] forPharo11: [3].
	self assert: packageHistories size = expectedSize
		description: [ self descriptionMessage: 'packageHistories size = ', expectedSize asString histories: packageHistories items ].

	mainPackageHistory := packageHistories
			historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not
		description: [ self descriptionMessage: 'mainPackageHistory hasNoEffect not' histories: { mainPackageHistory } ].

	secondPackageHistory := packageHistories
			historyForPackageNamed: self secondaryPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not
		description: [ self descriptionMessage: 'secondPackageHistory hasNoEffect not' histories: { secondPackageHistory } ].

	thirdPackageHistory := packageHistories
			historyForPackageNamed: self thirdPackageNameForTesting.
	self assert: thirdPackageHistory hasNoEffect not
		description: [ self descriptionMessage: 'thirdPackageHistory hasNoEffect not' histories: { thirdPackageHistory } ].

	methodHistoryInMainPackage := mainPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInMainPackage hasNoEffect
		description: [ self descriptionMessage: 'methodHistoryInMainPackage hasNoEffect' histories: { methodHistoryInMainPackage } ].
	self assert: methodHistoryInMainPackage changes size = 2
		description: [ self descriptionMessage: 'methodHistoryInMainPackage size = 2' histories: { methodHistoryInMainPackage } ].
	self assert: methodHistoryInMainPackage isInitialChangeAddition
		description: [ 'methodHistoryInMainPackage isInitialChangeAddition assertion failed' ].
	self assert: methodHistoryInMainPackage isLatestChangeRemoval
		description: [ 'methodHistoryInMainPackage isLatestChangeRemoval assertion failed' ].

	methodHistoryInSecondPackage := secondPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInSecondPackage hasNoEffect
		description: [ self descriptionMessage: 'methodHistoryInSecondPackage hasNoEffect' histories: { methodHistoryInSecondPackage } ].
	self assert: methodHistoryInSecondPackage changes size = 2
		description: [ self descriptionMessage: 'methodHistoryInSecondPackage size = 2' histories: { methodHistoryInSecondPackage } ].
	self assert: methodHistoryInSecondPackage isInitialChangeAddition
		description: [ 'methodHistoryInSecondPackage isInitialChangeAddition assertion failed' ].
	self assert: methodHistoryInSecondPackage isLatestChangeRemoval
		description: [ 'methodHistoryInSecondPackage isLatestChangeRemoval assertion failed' ].

	methodHistoryInThirdPackage := thirdPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInThirdPackage hasNoEffect not
		description: [ self descriptionMessage: 'methodHistoryInThirdPackage hasNoEffect not' histories: { methodHistoryInThirdPackage } ].
	self assert: methodHistoryInThirdPackage changes size = 1
		description: [ self descriptionMessage: 'methodHistoryInThirdPackage size = 1' histories: { methodHistoryInThirdPackage } ].
	self assert: methodHistoryInThirdPackage isInitialChangeAddition
		description: [ 'methodHistoryInThirdPackage isInitialChangeAddition assertion failed' ].
	self assert: methodHistoryInThirdPackage isLatestChangeRemoval not
		description: [ 'methodHistoryInThirdPackage isLatestChangeRemoval not assertion failed' ].

	^ entries
]

{ #category : #examples }
GtEpHistoryGroupingExamples >> testTransformMethodToExtensionMethodWithByPackageGrouping [
	<gtExample>
	<return: #GtEpiceaEntriesGroup>
	<shouldLogWithEpicea>
	| entries packageHistories mainPackageHistory secondPackageHistory methodHistoryInMainPackage methodHistoryInSecondPackage expectedSize |
	entries := self transformMethodToExtensionMethodEvents.
	packageHistories := entries packageHistories.

	self assert: packageHistories hasNoEffect not
		description: [ self descriptionMessage: 'packageHistories hasNoEffect not' histories: packageHistories items ].
	"packageHistories would normally contain 3 entries.
	Due to https://github.com/feenkcom/gtoolkit/issues/4734 it currently contains an unpackage entry as well in Pharo12."
	expectedSize := self forPharo12AndNewer: [2] forPharo11: [2].
	self assert: packageHistories size = expectedSize
		description: [ self descriptionMessage: 'packageHistories size = ', expectedSize asString histories: packageHistories items ].

	mainPackageHistory := packageHistories
			historyForPackageNamed: self mainPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not
		description: [ self descriptionMessage: 'mainPackageHistory hasNoEffect not' histories: { mainPackageHistory } ].

	secondPackageHistory := packageHistories
			historyForPackageNamed: self secondaryPackageNameForTesting.
	self assert: mainPackageHistory hasNoEffect not
		description: [ self descriptionMessage: 'secondPackageHistory hasNoEffect not' histories: { secondPackageHistory } ].

	methodHistoryInMainPackage := mainPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInMainPackage hasNoEffect
		description: [ self descriptionMessage: 'methodHistoryInMainPackage hasNoEffect' histories: { methodHistoryInMainPackage } ].
	self assert: methodHistoryInMainPackage changes size = 2
		description: [ self descriptionMessage: 'methodHistoryInMainPackage size = 2' histories: { methodHistoryInMainPackage } ].
	self assert: methodHistoryInMainPackage isInitialChangeAddition
		description: [ 'methodHistoryInMainPackage isInitialChangeAddition assertion failed' ].
	self assert: methodHistoryInMainPackage isLatestChangeRemoval
		description: [ 'methodHistoryInMainPackage isLatestChangeRemoval assertion failed' ].

	methodHistoryInSecondPackage := secondPackageHistory classHistories first
			methodHistories first.
	self assert: methodHistoryInSecondPackage hasNoEffect not
		description: [ self descriptionMessage: 'methodHistoryInSecondPackage hasNoEffect not' histories: { methodHistoryInSecondPackage } ].
	self assert: methodHistoryInSecondPackage changes size = 1
		description: [ self descriptionMessage: 'methodHistoryInSecondPackage size = 1' histories: { methodHistoryInSecondPackage } ].
	self assert: methodHistoryInSecondPackage isInitialChangeAddition
		description: [ 'methodHistoryInSecondPackage isInitialChangeAddition assertion failed' ].
	self assert: methodHistoryInSecondPackage isLatestChangeRemoval not
		description: [ 'methodHistoryInSecondPackage isLatestChangeRemoval assertion failed' ].

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
