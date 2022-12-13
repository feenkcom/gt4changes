Class {
	#name : #GtEpiceaPackageHistory,
	#superclass : #GtEpiceaEntityHistory,
	#instVars : [
		'targetPackageName',
		'classHistories',
		'latestChange'
	],
	#category : #'GToolkit4Epicea-History'
}

{ #category : #adding }
GtEpiceaPackageHistory >> addClassHistories: aCollection [
	aCollection do: [ :aClassHistory |
		self addClassHistory:  aClassHistory ]
]

{ #category : #adding }
GtEpiceaPackageHistory >> addClassHistory: aClassHistory [
	self classHistories add: aClassHistory
]

{ #category : #accessing }
GtEpiceaPackageHistory >> classHistories [
	^ classHistories
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewChangeDescriptionElements [
	^ {BlTextElement new 
		padding: (BlInsets all: 0);
		constraintsDo: [ :c | 
			c linear vertical alignCenter ];
		text: (self targetPackageName  asRopedText 
			bold; 
			glamorousRegularFont)}
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewChangeHistoryChildren [
	^ self classHistories
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewChangeIcon [
	self hasNoEffect ifTrue: [
		^ Smalltalk ui icons iconNamed: #emptyPackage ].
		
	^ Smalltalk ui icons iconNamed: #package
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewChangesCount [
	^ self classHistories gtViewChangesCount
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewClassHistoriesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'By Class';
		priority: 35;
		object: [ self classHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #'gt - extensions' }
GtEpiceaPackageHistory >> gtViewMethodHistoriesFor: aView [
	<gtView>
	<gtViewChanges>
	
	^ aView forward 
		title: 'By Method';
		priority: 45;
		object: [ self classHistories  methodHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #testing }
GtEpiceaPackageHistory >> hasNoEffect [
	^ self classHistories hasNoEffect
]

{ #category : #initialization }
GtEpiceaPackageHistory >> initialize [
	super initialize.
	
	classHistories := GtEpiceaClassHistoriesGroup new.
]

{ #category : #accessing }
GtEpiceaPackageHistory >> latestChange [ 
	^ latestChange ifNil:  [
		latestChange := self classHistories latestChange ]
]

{ #category : #printing }
GtEpiceaPackageHistory >> printOn: aStream [ 
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self targetPackageName]
]

{ #category : #accessing }
GtEpiceaPackageHistory >> targetPackageName [

	^ targetPackageName
]

{ #category : #accessing }
GtEpiceaPackageHistory >> targetPackageName: aPackageName [

	targetPackageName := aPackageName
]
