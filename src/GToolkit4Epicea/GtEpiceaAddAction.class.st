Class {
	#name : #GtEpiceaAddAction,
	#superclass : #GtEpiceaAction,
	#instVars : [
		'log'
	],
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #accessing }
GtEpiceaAddAction >> actionOn: aListOfEvents [

	aListOfEvents do: [ :each | 
		self log addEntryWith: each tags: [ :tags | "ignore" ] ].
	self log store flush
]

{ #category : #accessing }
GtEpiceaAddAction >> asDropdown [

	| aList aContainer selected |
	selected := OrderedCollection new.

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
		         (BrListStreamItemsProvider forCollection: self events).

	aList column
		title: 'Select';
		stencil: [ :anEpEvent :anIndex | 
			BrCheckbox new
				aptitude: BrGlamorousCheckboxAptitude
					+ (BrGlamorousWithLabelTooltipAptitude new text: 'Select');
				checked: false;
				whenCheckedDo: [ selected add: anEpEvent ];
				margin: (BlInsets right: 8);
				whenUncheckedDo: [ selected remove: anEpEvent ] ];
		width: 32.
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
			 action: [ self actionOn: selected ];
			 margin: (BlInsets top: 5)).

	^ aContainer
]

{ #category : #accessing }
GtEpiceaAddAction >> events: aCollectionOfEvents [

	events := OrderedCollection new.
	aCollectionOfEvents
		select: [ :entry | entry content isCodeChange ]
		thenDo: [ :entry | 
			self log store
				entryFor:
				(entry tags at: self log store selfReferenceKey ifAbsent: [ '' ])
				ifPresent: [ :anEntry |  ]
				ifAbsent: [ events add: entry content ] ]
]

{ #category : #accessing }
GtEpiceaAddAction >> log [
	^ log
]

{ #category : #accessing }
GtEpiceaAddAction >> log: aLog [
	log := aLog
]
