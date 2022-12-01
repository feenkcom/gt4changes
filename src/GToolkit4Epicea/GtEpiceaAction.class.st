Class {
	#name : #GtEpiceaAction,
	#superclass : #Object,
	#instVars : [
		'events',
		'anchor',
		'entries'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpiceaAction class >> on: aCollectionOfEntries [

	^ self new entries: aCollectionOfEntries
]

{ #category : #accessing }
GtEpiceaAction >> action [

	(self latestEntriesFrom: entries) do: 
		[:each | each content applyCodeChangeIfHasImpact ].
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow fireUpdateWish
]

{ #category : #accessing }
GtEpiceaAction >> actionAndInspect [
	| applied |

	applied := OrderedCollection new.
	(self latestEntriesFrom: entries) do: [ :each | 
		each content hasImpact ifTrue:
			[ each content applyCodeChange.
			applied add: each ] ].
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow spawnObject: (GtEpiceaExplicitLog on: applied).
]

{ #category : #accessing }
GtEpiceaAction >> anchor: aButton [
	anchor := aButton
]

{ #category : #accessing }
GtEpiceaAction >> asDropdown [
	| aList aContainer |
	aContainer := BrVerticalPane new
			hExact: 300;
			vExact: 500;
			alignCenterRight;
			padding: (BlInsets all: 5);
			addAptitude: BrGlamorousWithHorizontalResizerAptitude new
					+ BrGlamorousWithHorizontalResizerAptitude new beLeft
					+ BrGlamorousWithVerticalResizerAptitude new.

	self events
		ifEmpty: [ aContainer
				addChild: (BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						text: 'No relevant changes').
			^ aContainer alignCenter ].

	aList := BrColumnedList new
			itemsProvider: (BrStreamItemsProvider forCollection: self events).

	aList column
		title: 'Icon';
		stencil: [ :anEpEvent :anIndex | (anEpEvent accept: EpIconVisitor new) asElement ];
		width: 32.
	aList column
		title: 'Description';
		stencil: [ :anEpEvent :anIndex | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anEpEvent accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	aContainer addChild: aList matchParent.

	aContainer addChild: self confirmationButtons.

	^ aContainer
]

{ #category : #accessing }
GtEpiceaAction >> confirmationButtons [
	| horizontalPane confirmButton confirmAndInspectButton |

	horizontalPane := BrHorizontalPane new fitContent.
	confirmButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action');
		label: 'Confirm';
		action: [ self action ];
		margin: (BlInsets top: 5).
	confirmAndInspectButton := BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new
				+ (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action and inspect result');
		label: 'Confirm...';
		action: [ self actionAndInspect ];
		margin: (BlInsets top: 5).
	horizontalPane
		addChild: confirmButton;
		addChild: confirmAndInspectButton.
	^ horizontalPane.
]

{ #category : #accessing }
GtEpiceaAction >> entries [

	^ entries
]

{ #category : #accessing }
GtEpiceaAction >> entries: anObject [

	entries := anObject
]

{ #category : #accessing }
GtEpiceaAction >> events [
	^ self latestEventsFrom: entries
]

{ #category : #accessing }
GtEpiceaAction >> gtEventsFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Selected Changes';
		  priority: 3;
		  itemsProvider: [ self events asBrItemsProvider ];
		  column: 'Icon' icon: [ :anEpEvent :anIndex | 
			  (anEpEvent accept: EpIconVisitor new) asElement ]
		  width: 32;
		  column: 'Description' stencil: [ :anEpEvent :anIndex | 
			  BlElement new
				  layout: BlLinearLayout horizontal;
				  addChildren:
					  (anEpEvent accept: GtEpiceaBrickVisitor new);
				  constraintsDo: [ :c | 
					  c horizontal fitContent.
					  c vertical fitContent ] ];
		 actionButtonLabel: 'Confirm'
		 tooltip: 'Confirm action'
		 action: [ self action ]
]

{ #category : #accessing }
GtEpiceaAction >> latestEntriesFrom: previewEntriesTheNewestFirst [
	^ GtEpEventSequencer sequence: previewEntriesTheNewestFirst withCurrent: false
]

{ #category : #accessing }
GtEpiceaAction >> latestEventsFrom: previewEntriesTheNewestFirst [
	^ (GtEpEventSequencer sequence: previewEntriesTheNewestFirst withCurrent: false) collect: #content
]
