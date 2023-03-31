Class {
	#name : #GtEpiceaChangeListElement,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'log',
		'filters',
		'list',
		'selection',
		'model'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #'instance creation' }
GtEpiceaChangeListElement class >> forModel: aListModel [
	^ self new model: aListModel
]

{ #category : #accessing }
GtEpiceaChangeListElement >> cellSpacing [
	^ 10
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
	filters padding: (BlInsets left: self leftPadding).
	filters
		when: GtFiltersChangedEvent
		do: [ :event | 
			model applyFiltersFrom: event filterElement.
			self updateList ]
]

{ #category : #accessing }
GtEpiceaChangeListElement >> initializeList [
	list := BrColumnedList new matchParent aptitude: BrColumnedMultiListAptitude.

	list column
		title: 'Type';
		cellStencil: [ BlElement new
				layout: BlLinearLayout horizontal alignCenter;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ];
		dataBinder: [ :anElement :anEpEvent | 
			anElement
				removeChildren;
				addChild: (anEpEvent content accept: EpIconVisitor new) asElement ];
		width: 32.
	list column
		title: 'Description';
		matchParent;
		cellStencil: [ BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical exact: 26 ] ];
		dataBinder: [ :anElement :anEpEvent | 
			anElement
				removeChildren;
				addChildren: (anEpEvent content accept: GtEpiceaBrickVisitor new) ].
	list column
		width: 150;
		title: 'Timestamp';
		cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
		dataBinder: [ :aLabel :anEpEvent | aLabel text: (model timeAt: anEpEvent) printToSeconds ].

	list addEventHandler: GtPhlowListToSelectHandler new.

	list
		when: BrSelectionChanged
		do: [ :anEvent | 
			| selected |
			selected := anEvent indices
					collect: [ :anIndex | model allEvents at: anIndex ].
			model setSelection: selected ].

	list
		rowStencil: (GtPhlowColumnedListItemElementWithContextMenuDecorator new
				stencilBuilder: (BrGlamorousColumnedListSelectableRowElementStencilBuilder new
						cellSpacing: self leftPadding);
				contextMenuStencil: [ :element :item | 
					| contextMenuItems |
					contextMenuItems := {'Apply'
								-> [ :e | 
									e phlow
										spawnTool: (GtPhlowValuableTool new
												name: 'Apply Changes';
												valuable: [ GtEpiceaApplyChangesDetailsElement new matchParent
														entries: model selectedCodeEvents;
														anchor: element ]) ]".
							'Revert'
								-> [ :e | 
									e phlow
										spawnObject: (GtEpiceaApplyChangesDetailsElement new
												entries: (model selectedCodeEvents collect: [:anEvent | anEvent asRevertedCodeChange ]) reversed;
												anchor: element) ]"} asOrderedCollection.
					model selectedCodeEvents size = 1
						ifTrue: [ contextMenuItems
								add: 'Browse current version'
										-> [ :e | 
											(item content isKindOf: EpMethodChange)
												ifTrue: [ item content methodAffected compiledMethod gtBrowseFrom: element ].

											(item content isKindOf: EpClassChange)
												ifTrue: [ item content behaviorAffected realClass gtBrowseFrom: element ] ] ].
					BrGlamorousSimpleContextMenuContent new items: contextMenuItems ]).

	list
		selectionCallback: [ :indices | 
			indices size = 1
				ifTrue: [ list viewModel itemAt: indices first ]
				ifFalse: [ GtEpiceaExplicitLog
						on: (indices collect: [ :anIndex | list viewModel itemAt: anIndex ]) ] ].

	list
		addAptitude: (BrColumnedListHeaderAptitude new cellSpacing: self leftPadding)
]

{ #category : #accessing }
GtEpiceaChangeListElement >> leftPadding [
	^ 10
]

{ #category : #accessing }
GtEpiceaChangeListElement >> list [
	^ list
]

{ #category : #accessing }
GtEpiceaChangeListElement >> model: aListModel [
	model := aListModel.
	model whenReady: [
				self removeChildNamed: #pending.
				self updateElement ]
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
GtEpiceaChangeListElement >> updateElement [
	self updateFilters.
	self updateList
]

{ #category : #accessing }
GtEpiceaChangeListElement >> updateFilters [
	filters descriptors: model filterDescriptors
]

{ #category : #accessing }
GtEpiceaChangeListElement >> updateList [
	list itemsProvider: model availableProvider
]
