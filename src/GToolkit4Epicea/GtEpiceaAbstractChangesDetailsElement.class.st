Class {
	#name : #GtEpiceaAbstractChangesDetailsElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'events',
		'anchor',
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
	self sequencedEntries
		do: [:each | each content applyCodeChangeIfHasImpact].
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow fireToolUpdateWish
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> actionAndInspect [
	| appliedEntries |
	appliedEntries := OrderedCollection new.
	self sequencedEntries do: 
			[:each |
			each content hasImpact
				ifTrue: 
					[each content applyCodeChange.
					appliedEntries add: each]].
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow spawnObject: (GtEpiceaExplicitLog on: appliedEntries)
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> anchor: aButton [
	anchor := aButton
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

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> computeSequencedEntries [
	^ GtEpInImageEventSequencer sequence: self entries
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createApplyAndInspectResultActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action and inspect result');
		label: 'Confirm and Inspect Result';
		action: [ self actionAndInspect ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createApplyChangesActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action');
		label: 'Confirm';
		action: [ self action ]
]

{ #category : #accessing }
GtEpiceaAbstractChangesDetailsElement >> createInspectActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Inspect the changes that are going to be applied.');
		label: 'Inspect';
		action: [ 
			anchor phlow spawnObject: (GtEpEventSequencer entries: entries includeCurrent: false).
			anchor fireEvent: BrDropdownHideWish new ]
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
