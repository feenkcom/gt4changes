Class {
	#name : #GtEpiceaAbstractLog,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #accessing }
GtEpiceaAbstractLog >> codeEvents [
	^ self entries select: [ :anEntry | anEntry content isCodeChange ]
]

{ #category : #accessing }
GtEpiceaAbstractLog >> entries [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> entriesStream [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> gtEventsFor: aView [
	<gtView>
	<gtViewChanges>
	| view selected |
	selected := self codeEvents.

	view := aView columnedList
			title: 'Change List';
			priority: 3;
			itemsProvider: [ BrListStreamItemsProvider forCollection: self entries reversed ];
			itemContextMenuStencil: [ :element :item | 
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
					ifFalse: [ BrGlamorousSimpleContextMenuContent new ] ];
			column: 'Selected'
				stencil: [ :anEpEvent :anIndex | 
					anEpEvent content isCodeChange
						ifTrue: [ BrCheckbox new
								aptitude: BrGlamorousCheckboxAptitude
										+ (BrGlamorousWithLabelTooltipAptitude new text: 'Select');
								checked: true;
								whenCheckedDo: [ selected add: anEpEvent content ];
								margin: (BlInsets right: 8);
								whenUncheckedDo: [ selected remove: anEpEvent content ] ]
						ifFalse: [ BlElement new size: 1 @ 1 ] ]
				width: 32;
			column: 'Icon'
				icon: [ :anEpEvent :anIndex | (anEpEvent content accept: EpIconVisitor new) asElement ]
				width: 32;
			column: 'Description'
				stencil: [ :anEpEvent :anIndex | 
					BlElement new
						layout: BlLinearLayout horizontal;
						addChildren: (anEpEvent content accept: GtEpiceaBrickVisitor new);
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContent ] ];
			column: 'Timestamp' text: [ :anEpEvent :anIndex | self timeAt: anEpEvent ].
	(self isFrozen or: [ self isActive ])
		ifFalse: [ view
				actionDropdownButtonIcon: BrGlamorousVectorIcons add
				tooltip: 'Add Selected Changes'
				content: [ :aButton | 
					(GtEpiceaAddAction new
						log: self;
						anchor: aButton;
						events: EpMonitor current log entries) asDropdown ] ].
	view
		actionDropdownButtonLabel: 'Apply'
			tooltip: 'Apply Selected Changes'
			content: [ :aButton | 
				(GtEpiceaApplyAction on: (self orderEvents: selected))
					anchor: aButton;
					asDropdown ];
		actionDropdownButtonLabel: 'Revert'
			tooltip: 'Revert Selected Changes'
			content: [ :aButton | 
				(GtEpiceaRevertAction on: (self orderEvents: selected))
					anchor: aButton;
					asDropdown ];
		actionDropdownButtonLabel: 'Filters'
			tooltip: 'Apply and remove filters from the list'
			content: [ :aDropdown :aTab | 
				| filters aList aContainer selectedFilters |
				selectedFilters := Set new.
				aContainer := BrVerticalPane new fitContent alignCenterRight.
				filters := GtPhlowCollector new
						fromObject: self;
						pragmaName: #gtChangeFilter;
						collectAllPragmas.
				aList := BrColumnedList new
						padding: (BlInsets all: 5);
						fitContent;
						items: filters.
				aList column
					title: 'Active';
					width: 50;
					stencil: [ :item | 
						BrCheckbox new
							aptitude: BrGlamorousCheckboxAptitude
									+ (BrGlamorousWithLabelTooltipAptitude new text: 'Select for Commit');
							margin: (BlInsets left: 10);
							whenCheckedDo: [ selectedFilters add: item ];
							whenUncheckedDo: [ selectedFilters remove: item ] ].
				aList column
					title: 'Name';
					stencil: [ :aFilter | 
						BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: (aFilter method selector removeSuffix: 'Filter:') ].
				aList addAptitude: BrColumnedListHeaderAptitude.
				aContainer
					addChild: aList;
					addChild: (BrButton new
							aptitude: BrGlamorousButtonWithIconAptitude;
							icon: BrGlamorousVectorIcons accept;
							margin: (BlInsets all: 5);
							action: [ :aButton | 
								| newItems |
								newItems := self entriesStream.
								selectedFilters
									do: [ :aPragma | newItems := self perform: aPragma methodSelector withArguments: {newItems} ].
								aTab viewContentElement children first children second
									itemsProvider: (BrListStreamItemsProvider forCollection: newItems toArray wait reversed).
								aButton fireEvent: BrDropdownHideWish new ]) ].

	^ view
]

{ #category : #accessing }
GtEpiceaAbstractLog >> isActive [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> isFrozen [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> log [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpiceaAbstractLog >> orderEvents: aCollectionOfEvents [
	^ (aCollectionOfEvents sorted: [:a :b | (self timeAt: a) > (self timeAt: b)]) collect: #content
]

{ #category : #accessing }
GtEpiceaAbstractLog >> timeAt: anEpEvent [ 
	^ self subclassResponsibility
]
