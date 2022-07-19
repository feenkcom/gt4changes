Class {
	#name : #GtEpiceaChangeListElement,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'log',
		'filters',
		'list',
		'selection'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #'instance creation' }
GtEpiceaChangeListElement class >> onLog: anEpLog [
	^ self new log: anEpLog
]

{ #category : #accessing }
GtEpiceaChangeListElement >> filters [
	^ filters
]

{ #category : #accessing }
GtEpiceaChangeListElement >> initialize [
	super initialize.
	
	self layout: BlLinearLayout vertical.
	
	self initializeFilters.
	self initializeList.
	
	self addChild: self filters as: #filters.
	self addChild: self list as: #list.
	self addChild: self pendingBlock as: #pending.
	
	self matchParent
]

{ #category : #accessing }
GtEpiceaChangeListElement >> initializeFilters [
	filters := GtFiltersElement new.
	filters
		when: GtFiltersChangedEvent
		do: [ :event | 
			| items |
			items := self log entriesStream.
			event filterElement
				filtersDo: [ :descriptor :ignored | items := descriptor newFilterWithValue: items ].
			list
				itemsProvider: (BrStreamItemsProvider forCollection: items toArray wait reversed) ]
]

{ #category : #accessing }
GtEpiceaChangeListElement >> initializeList [
	list := BrColumnedList new matchParent.
	list column
		title: 'Selected';
		stencil: [ :anEpEvent :anIndex | 
			anEpEvent content isCodeChange
				ifTrue: [ BrCheckbox new
						aptitude: BrGlamorousCheckboxAptitude
								+ (BrGlamorousWithLabelTooltipAptitude new text: 'Select');
						checked: true;
						whenCheckedDo: [ selection add: anEpEvent ];
						margin: (BlInsets left: 20);
						whenUncheckedDo: [ selection remove: anEpEvent ] ]
				ifFalse: [ BlElement new size: 1 @ 1 ] ];
		width: 56.


	list column
		title: 'Icon';
		stencil: [ :anEpEvent :anIndex | (anEpEvent content accept: EpIconVisitor new) asElement ];
		width: 32.
	list column
		title: 'Description';
		matchParent;
		stencil: [ :anEpEvent :anIndex | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anEpEvent content accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	list column
		width: 250;
		title: 'Timestamp';
		cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
		dataBinder: [ :aLabel :anEpEvent | aLabel text: (self log timeAt: anEpEvent) asString ].

	list
		when: BrSelectionChanged
		do: [ :anEvent | 
			anEvent indices
				ifNotEmpty: [ | aWidgetElement selectedObject |
					aWidgetElement := anEvent currentTarget.
					selectedObject := aWidgetElement viewModel itemAt: anEvent indices first.
					self phlow spawnObject: selectedObject ] ].

	list
		rowStencil: (GtPhlowColumnedListItemElementWithContextMenuDecorator new
				stencilBuilder: BrGlamorousColumnedListSelectableRowElementStencilBuilder new;
				contextMenuStencil: [ :element :item | 
					item content isCodeChange
						ifTrue: [ BrGlamorousSimpleContextMenuContent new
								items: {'Apply'
											-> [ :e | 
												item content applyCodeChange.
												element phlow fireUpdateWish ].
										'Revert'
											-> [ :e | 
												item content asRevertedCodeChange applyCodeChange.
												element phlow fireUpdateWish ]};
								yourself ]
						ifFalse: [ BrGlamorousSimpleContextMenuContent new ] ]).

	list addAptitude: BrColumnedListHeaderAptitude
]

{ #category : #accessing }
GtEpiceaChangeListElement >> list [
	^ list
]

{ #category : #accessing }
GtEpiceaChangeListElement >> log [
	^ log
]

{ #category : #accessing }
GtEpiceaChangeListElement >> log: anEpLog [
	log := anEpLog.
	selection := log entriesStream toArray
			then: [ :value | 
				selection := value asOrderedCollection.
				self removeChildNamed: #pending.
				self updateElement ].
	selection await
]

{ #category : #accessing }
GtEpiceaChangeListElement >> pendingBlock [
	^ BrLabel new
		matchParent;
		alignCenter;
		aptitude: (BrGlamorousLabelAptitude new
				foreground: BrGlamorousColors disabledButtonTextColor);
		text: 'Computing changes...'
]

{ #category : #accessing }
GtEpiceaChangeListElement >> selectedCodeEvents [
	^ selection select: [ :event | event content isCodeChange ]
]

{ #category : #accessing }
GtEpiceaChangeListElement >> selection [
	^ selection
]

{ #category : #accessing }
GtEpiceaChangeListElement >> updateElement [
	self updateFilters.
	self updateList
]

{ #category : #accessing }
GtEpiceaChangeListElement >> updateFilters [
	filters
		descriptors: ((GtPhlowCollector new
				fromObject: self log;
				pragmaName: #gtChangeFilter;
				collectAllPragmas)
				collect: [ :aPragma | self log perform: aPragma methodSelector ])
]

{ #category : #accessing }
GtEpiceaChangeListElement >> updateList [
	list itemsProvider: (BrStreamItemsProvider forCollection: selection reversed)
]
