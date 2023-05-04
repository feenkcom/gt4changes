Class {
	#name : #GtEpiceaApplyChangesDetailsElement,
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

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> action [

	self sequencedEntries do:  [:each | 
		each content applyCodeChangeIfHasImpact ].
		
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow fireUpdateWish
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> actionAndInspect [
	| appliedEntries |

	appliedEntries := OrderedCollection new.
	
	self sequencedEntries do: [ :each | 
		each content hasImpact ifTrue:
			[ each content applyCodeChange.
			appliedEntries add: each ] ].
	
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow spawnObject: (GtEpiceaExplicitLog on: appliedEntries).
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> anchor: aButton [
	anchor := aButton
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> buildActionButtonElements [
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
GtEpiceaApplyChangesDetailsElement >> buildChangesListElement [
	| newChangesList |
	
	newChangesList := BrColumnedList new
		matchParent.

	newChangesList column
		title: 'Icon';
		stencil: [ :anOmEntry :anIndex | 
			(anOmEntry content accept: EpIconVisitor new) asElement ];
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
GtEpiceaApplyChangesDetailsElement >> buildEmptyContentElement [
	^ BrFrame new 
		fitContent;
		addChild:  (BrLabel new
			aptitude: BrGlamorousLabelAptitude;
			text: 'No relevant changes');
		yourself
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> computeSequencedEntries [
	^ GtEpEventSequencer sequence: self entries withCurrent: false
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> createApplyAndInspectResultActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action and inspect result');
		label: 'Confirm and Inspect Result';
		action: [ self actionAndInspect ]
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> createApplyChangesActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action');
		label: 'Confirm';
		action: [ self action ]
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> createInspectActionButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Inspect the changes that are going to be applied.');
		label: 'Inspect';
		action: [ 
			anchor phlow spawnObject: (GtEpEventSequencer entries: entries includeCurrent: false).
			anchor fireEvent: BrDropdownHideWish new ]
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> entries: aListOfChanges [

	entries := aListOfChanges.
	sequencedEntries := nil.
	
	self initializeContent.
	self updateContent.
]

{ #category : #initialization }
GtEpiceaApplyChangesDetailsElement >> initialize [
	super initialize.
	
	self 
		hExact: 350;
		vExact: 500;
		alignCenter;
		padding: (BlInsets all: 5);
		addAptitude: BrGlamorousWithHorizontalResizerAptitude new beLeft
			+ BrGlamorousWithVerticalResizerAptitude new 
]

{ #category : #initialization }
GtEpiceaApplyChangesDetailsElement >> initializeContent [

	self sequencedEntries ifEmpty: [ 
		self addChild: self buildEmptyContentElement.
		^ self ].

	self addChild: (changesList := self buildChangesListElement).
	self addChild: self buildActionButtonElements.
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> latestEntriesFrom: previewEntriesTheNewestFirst [
	^ GtEpEventSequencer sequence: previewEntriesTheNewestFirst withCurrent: false
]

{ #category : #accessing }
GtEpiceaApplyChangesDetailsElement >> sequencedEntries [
	^ sequencedEntries ifNil: [
		sequencedEntries := self computeSequencedEntries]
]

{ #category : #updating }
GtEpiceaApplyChangesDetailsElement >> updateContent [
	"Update the receiver's content.
	If there are no sequencedEntries changesList will be nil."

	changesList ifNil: [ ^ self ].
	changesList itemsProvider: (BrStreamItemsProvider 
		forCollection: self sequencedEntries)
]
