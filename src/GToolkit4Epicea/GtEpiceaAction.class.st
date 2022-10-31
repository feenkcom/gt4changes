Class {
	#name : #GtEpiceaAction,
	#superclass : #Object,
	#instVars : [
		'events',
		'anchor'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'instance creation' }
GtEpiceaAction class >> on: aCollectionOfEvents [

	^ self new events: aCollectionOfEvents
]

{ #category : #accessing }
GtEpiceaAction >> action [
	events do: [:each | each applyCodeChange ].
	anchor fireEvent: BrDropdownHideWish new.
	anchor phlow fireUpdateWish
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
		              addAptitude:
			              BrGlamorousWithHorizontalResizerAptitude new
			              + BrGlamorousWithHorizontalResizerAptitude new beLeft
			              + BrGlamorousWithVerticalResizerAptitude new.

	events ifEmpty: [ 
		aContainer addChild: (BrLabel new
				 aptitude: BrGlamorousLabelAptitude;
				 text: 'No relevant changes').
		^ aContainer alignCenter ].

	aList := BrColumnedList new itemsProvider:
		         (BrStreamItemsProvider forCollection: self events).

	aList column
		title: 'Icon';
		stencil: [ :anEpEvent :anIndex | 
			(anEpEvent accept: EpIconVisitor new) asElement ];
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

	aContainer addChild: (BrButton new
			 aptitude: BrGlamorousButtonWithLabelAptitude new
				 +
					 (BrGlamorousWithLabelTooltipAptitude new text: 'Confirm action');
			 label: 'Confirm';
			 action: [ self action ];
			 margin: (BlInsets top: 5)).

	^ aContainer
]

{ #category : #accessing }
GtEpiceaAction >> events [
	^ events
]

{ #category : #accessing }
GtEpiceaAction >> events: aCollectionOfEvents [
	events := (self
			treatEvents: (self latestEventsFrom: aCollectionOfEvents))
			select: [ :eachEvent | eachEvent accept: (EpHasImpactVisitor inEnvironment: self class environment) ]
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
GtEpiceaAction >> latestEventsFrom: previewEventsTheNewestFirst [

	| result |
	result := OrderedCollection new.
	previewEventsTheNewestFirst do: [ :each | 
		(result anySatisfy: [:resultElement | resultElement affectedMarker = each affectedMarker ]) ifFalse: [ result add: each ] ].
	^ result reverse
]

{ #category : #accessing }
GtEpiceaAction >> treatEvents: aCollectionOfEvents [
	^ self subclassResponsibility
]
