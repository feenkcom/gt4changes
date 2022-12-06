Class {
	#name : #GtEpiceaClassHistory,
	#superclass : #GtEpiceaEntityHistory,
	#instVars : [
		'methodHistories',
		'behaviourChanges',
		'targetClass',
		'targetClassName'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpiceaClassHistory class >> forClass: aTargetClass withBehaviourChanges: aCollectionOfEntries [
	^ self new 
		targetClass: aTargetClass;
		behaviourChanges: (GtEpiceaEntriesGroup 
			withAll: (aCollectionOfEntries 
				sorted: [ :anEntry | anEntry gtTime] descending ))
]

{ #category : #adding }
GtEpiceaClassHistory >> addMethodHistory: aMethodHistory [
	self methodHistories add: aMethodHistory 
]

{ #category : #accessing }
GtEpiceaClassHistory >> behaviourChanges [

	^ behaviourChanges
]

{ #category : #accessing }
GtEpiceaClassHistory >> behaviourChanges: aCollectionOfEntries [

	behaviourChanges := aCollectionOfEntries
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewChangeDescriptionElements [
	^ {BrLabel new 
		aptitude: BrGlamorousLabelAptitude;
		text: (self targetClassName  asRopedText 
			bold; 
			glamorousRegularFont)}
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewChangeHistoryChildren [
	^ self methodHistories
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewChangeIcon [
	self hasNoEffect ifTrue: [
		^ Smalltalk ui icons iconNamed: #windowMinimizeInactive ].
		
	self hasOnlyMethodChanges ifTrue: [
		^ Smalltalk ui icons iconNamed: #changeUpdateIcon ].
	
	self isLatestBehaviourChangeRemoval ifTrue: [
		^ Smalltalk ui icons iconNamed: #changeRemoveIcon ].
	
	self isInitialBehaviourChangeAddition ifTrue: [
		^ Smalltalk ui icons iconNamed: #changeAddIcon ].
		
	^ Smalltalk ui icons iconNamed: #changeUpdateIcon
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewChangesCount [
	^ self methodHistories gtViewChangesCount
			+ self behaviourChanges size
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewEntriesListFor: aView [ 
	<gtView>
	
	^ aView forward 
		title: 'Class Changes';
		priority: 10;
		object: [ self behaviourChanges ];
		view: #gtItemsFor:
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewFullChangesFor: aView [
	<gtView>
	
	^ aView columnedTree 
		title: 'History';
		priority: 5;
		items: [ 
			(self methodHistories items
			, self behaviourChanges items)
				sorted: [ :aMHistoryEntity | 
					aMHistoryEntity gtViewLatestChangeTime ] descending ];
		children: [ :anEntry |
			anEntry gtViewChangeHistoryChildren ];
		column: 'Type ' do: [ :aColumn | 
			aColumn 
				width: 55;
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal alignCenter;
					padding: (BlInsets left:10);
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical fitContent ] ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChild: anEntry gtViewChangeIcon asElement ] ];
		column: 'Change' do: [ :aColumn |
			aColumn 
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: 26 ] ];
				dataBinder: [ :anElement :anEntry | 
					anElement
						removeChildren;
						addChildren: anEntry gtViewChangeDescriptionElements ] ]; 
		column: 'Timestamp' text: [ :anEntry | 
			anEntry gtViewLatestChangeTime printToSeconds ] width: 150
]

{ #category : #'gt - extensions' }
GtEpiceaClassHistory >> gtViewMethodHistoriesFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Methods Changes';
		priority: 20;
		object: [ self methodHistories ];
		view: #gtViewHistoriesFor: 
]

{ #category : #testing }
GtEpiceaClassHistory >> hasBehaviourChanges [
	^ self behaviourChanges size > 0
]

{ #category : #testing }
GtEpiceaClassHistory >> hasBehaviourChangesWithEffect [
	^ self hasBehaviourChanges
]

{ #category : #testing }
GtEpiceaClassHistory >> hasNoEffect [
	^ self hasOnlyMethodChanges
		ifTrue: [
			"In case only methods changed, all method histories should have no effect"
			self methodHistories hasNoEffect ] 
		ifFalse: [
			self hasNoEffectInBehaviourChanges ]
]

{ #category : #testing }
GtEpiceaClassHistory >> hasNoEffectInBehaviourChanges [
	^ self isInitialBehaviourChangeAddition and: [ 
		self isLatestBehaviourChangeRemoval ] 
]

{ #category : #testing }
GtEpiceaClassHistory >> hasOnlyMethodChanges [
	^ self hasBehaviourChanges not
]

{ #category : #initialization }
GtEpiceaClassHistory >> initialize [
	super initialize.
	
	behaviourChanges := GtEpiceaEntriesGroup new.
	methodHistories := GtEpiceaMethodHistoriesGroup new.
]

{ #category : #testing }
GtEpiceaClassHistory >> isInitialBehaviourChangeAddition [
	| epEvent |
	
	epEvent := self behaviourChanges initialChange content.
	^ (epEvent class = EpClassAddition) or: [
		epEvent class = EpTraitAddition  "or: [
			epEvent class = EpBehaviorNameChange and: [
				epEvent newName = self targetClassName ] ]" ]
]

{ #category : #testing }
GtEpiceaClassHistory >> isLatestBehaviourChangeRemoval [
	| epEvent |
	
	epEvent := self behaviourChanges latestChange content.
	^ epEvent class = EpClassRemoval or: [
		epEvent class = EpTraitRemoval ]
]

{ #category : #accessing }
GtEpiceaClassHistory >> latestChange [
	^ ({self methodHistories latestChange. 
		self behaviourChanges latestChange} 
			reject: [ :anOmbuEntry | anOmbuEntry isNil ])
			detectMax: [ :anOmbuEntry | anOmbuEntry gtTime]
]

{ #category : #accessing }
GtEpiceaClassHistory >> methodHistories [
	^ methodHistories
]

{ #category : #printing }
GtEpiceaClassHistory >> printOn: aStream [ 
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self targetClassName]
]

{ #category : #accessing }
GtEpiceaClassHistory >> targetClass [

	^ targetClass
]

{ #category : #accessing }
GtEpiceaClassHistory >> targetClass: anRbClassDefinition [

	targetClass := anRbClassDefinition.
	self targetClassName:  anRbClassDefinition name
]

{ #category : #accessing }
GtEpiceaClassHistory >> targetClassName [

	^ targetClassName
]

{ #category : #accessing }
GtEpiceaClassHistory >> targetClassName: aSymbol [

	targetClassName := aSymbol
]
