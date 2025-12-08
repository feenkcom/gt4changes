Class {
	#name : #GtEpiceaAbstractChangesDetailsElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'events',
		'entries',
		'changesList',
		'sequencedEntries'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #acccessing }
GtEpiceaAbstractChangesDetailsElement class >> preferredWidgetExtent [
	^ 400@500
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> action [
	
	GtVmMemoryConfigurationInstaller default 
		applyForLargeObjectAllocationsDuring:  [ self loadSequencedChanges ] 
		methodSourcesSize: self changedMethodsSourceCodeSize.
	 
	self anchor fireEvent: BrDropdownHideWish new.
	self anchor phlow fireToolUpdateWish
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> actionAndInspect [
	| appliedEntries |
	
	GtVmMemoryConfigurationInstaller default 
		applyForLargeObjectAllocationsDuring:  [
			appliedEntries := self loadSequencedChangesCollectingChanged. ] 
		methodSourcesSize: self changedMethodsSourceCodeSize.
	
	self anchor fireEvent: BrDropdownHideWish new.
	self anchor phlow 
		spawnObject: (GtEpiceaExplicitLog on: appliedEntries)
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> buildActionButtonElements [
	| horizontalPane inspectButton confirmButton confirmAndInspectButton |

	horizontalPane := BrHorizontalPane new 
		fitContent;
		alignCenterRight;
		cellSpacing: 5;
		padding: (BlInsets right: 15);
		margin: (BlInsets top: 5).
	
	inspectButton := self createInspectActionButton.
	confirmButton := self createApplyChangesActionButton.
	confirmAndInspectButton := self createApplyAndInspectResultActionButton.
		
	horizontalPane
		addChild: inspectButton;
		addChild: confirmButton;
		addChild: confirmAndInspectButton.
	^ horizontalPane.
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> buildChangesListElement [
	| newChangesList |
	
	newChangesList := BrColumnedList new
		matchParent.

	newChangesList column
		title: 'Icon';
		stencil: [ :anOmbuEntry :anIndex | 
			anOmbuEntry gtViewChangeIcon asElement ];
		width: 32.
	
	newChangesList column
		title: 'Description';
		stencil: [ :anOmEntry  | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anOmEntry content accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical exact: 24 ] ].
					
	^ newChangesList
]

{ #category : #initialization }
GtEpiceaAbstractChangesDetailsElement >> buildEmptyContentElement [
	^ BrFrame new 
		fitContent;
		addChild:  (BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			text: 'No relevant changes');
		yourself
]

{ #category : #'as yet unclassified' }
GtEpiceaAbstractChangesDetailsElement >> changedMethodsSourceCodeSize [
	^(self entries 
		select: [ :each |
			each content notNil and: [
				each content isEpMethodChange and: [
					each content isEpMethodAddition or: [
						each content isEpMethodModification ] ] ] ]) 
		inject: 0
		into: [ :sum :each |  
			sum + (each content methodAffected sourceCode sizeInMemory) ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> computeSequencedEntries [
	^ GtEpInImageEventSequencer sequence: self entries
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createApplyAndInspectResultActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithExplicitTooltipAptitude text: 'Confirm action and inspect result');
		label: 'Confirm and Inspect Result';
		action: [ self actionAndInspect ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createApplyChangesActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithExplicitTooltipAptitude text: 'Confirm action');
		label: 'Confirm';
		action: [ self action ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createInspectActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithExplicitTooltipAptitude text: 'Inspect the changes that are going to be applied.');
		label: 'Inspect';
		action: [ 
			self anchor phlow spawnObject: (GtEpInImageEventSequencer entries: entries inImage: true).
			self anchor fireEvent: BrDropdownHideWish new ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> entries: aListOfChanges [
	entries := aListOfChanges.
	sequencedEntries := nil.
	self initializeContent.
	self updateContent
]

{ #category : #initialization }
GtEpiceaAbstractChangesDetailsElement >> initialize [
	super initialize.
	
	self 
		exact: self class preferredWidgetExtent;
		alignCenter;
		padding: (BlInsets all: 5);
		addAptitude: BrGlamorousWithHorizontalResizerAptitude new beLeft
			+ BrGlamorousWithVerticalResizerAptitude new 
]

{ #category : #initialization }
GtEpiceaAbstractChangesDetailsElement >> initializeContent [

	self sequencedEntries ifEmpty: [ 
		self addChild: self buildEmptyContentElement.
		^ self ].

	self addChild: (changesList := self buildChangesListElement).
	self addChild: self buildActionButtonElements.
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> latestEntriesFrom: previewEntriesTheNewestFirst [
	^ GtEpInImageEventSequencer sequence: previewEntriesTheNewestFirst
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> loadSequencedChanges [
	^ self sequencedEntries
		do: [:each | each content applyCodeChangeIfHasImpact].
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> loadSequencedChangesCollectingChanged [
	| appliedEntries |
	appliedEntries := OrderedCollection new.
	self sequencedEntries do: 
			[ :each |
			each hasImpact ifTrue: 
				[ each applyCodeChange.
				appliedEntries add: each ] ].
	^ appliedEntries
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> sequencedEntries [
	^ sequencedEntries ifNil: [
		sequencedEntries := self computeSequencedEntries]
]

{ #category : #updating }
GtEpiceaAbstractChangesDetailsElement >> updateContent [
	"Update the receiver's content.
	If there are no sequencedEntries changesList will be nil."

	changesList ifNil: [ ^ self ].
	changesList itemsProvider: (BrStreamItemsProvider 
		forCollection: self sequencedEntries)
]
