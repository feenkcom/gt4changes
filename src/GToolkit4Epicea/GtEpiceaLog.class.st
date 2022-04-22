Class {
	#name : #GtEpiceaLog,
	#superclass : #Object,
	#instVars : [
		'log'
	],
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #'instance creation' }
GtEpiceaLog class >> allInSessionStore [
	<script>
	| monitor directory currentGlobalName |
	monitor := EpMonitor current.
	directory := monitor sessionStore baseLocator.
	currentGlobalName := monitor sessionStore store globalName.
	^ (EpFileLogNode fromAllLogsIn: directory)
		sort: [ :a :b | a modificationTime >= b modificationTime ];
		collect: [ :n | 
			| node |
			node := n globalName = currentGlobalName
				ifTrue: [ EpMonitorLogNode for: monitor ]
				ifFalse: [ n ].
			self new
				log: node log;
				yourself ]
]

{ #category : #accessing }
GtEpiceaLog >> additionFilter: aStream [

	<gtChangeFilter>
	^ aStream filter: [ :aChange | 
		  aChange content isCodeChange and: [ 
			  aChange content class name endsWith: #Addition ] ]
]

{ #category : #accessing }
GtEpiceaLog >> endTime [
	^ self log endTime
]

{ #category : #accessing }
GtEpiceaLog >> gtEventsFor: aView [

	<gtView>
	<gtViewChanges>
	| view selected |
	selected := self log entries
		             select: [ :anEntry | anEntry content isCodeChange ] thenCollect: #content.
	view := aView columnedList
		        title: 'Change List';
		        priority: 3;
		        itemsProvider: [ self log entriesStream ];
		        itemContextMenuStencil: [ :element :item | 
			        item content isCodeChange
				        ifTrue: [ 
					        BrGlamorousSimpleContextMenuContent new
						        items: { 
								        ('Apply' -> [ :e | 
									         item content applyCodeChange.
									         element phlow fireUpdateWish ]).
								        ('Revert' -> [ :e | 
									         item asRevertedCodeChange content applyCodeChange.
									         element phlow fireUpdateWish ]) };
						        yourself ]
				        ifFalse: [ BrGlamorousSimpleContextMenuContent new ] ];
		        column: 'Selected' stencil: [ :anEpEvent :anIndex | 
			        anEpEvent content isCodeChange
				        ifTrue: [ 
					        BrCheckbox new
						        aptitude: BrGlamorousCheckboxAptitude
							        +
								        (BrGlamorousWithLabelTooltipAptitude new text:
										         'Select');
						        checked: true;
						        whenCheckedDo: [ selected add: anEpEvent content ];
						        margin: (BlInsets right: 8);
						        whenUncheckedDo: [ selected remove: anEpEvent content ] ]
				        ifFalse: [ BlElement new size: 1 @ 1 ] ]
		        width: 32;
		        column: 'Icon' icon: [ :anEpEvent :anIndex | 
			        (anEpEvent content accept: EpIconVisitor new) asElement ]
		        width: 32;
		        column: 'Description' stencil: [ :anEpEvent :anIndex | 
		        BlElement new
			        layout: BlLinearLayout horizontal;
			        addChildren:
				        (anEpEvent content accept: GtEpiceaBrickVisitor new);
			        constraintsDo: [ :c | 
				        c horizontal fitContent.
				        c vertical fitContent ] ];
		        column: 'Timestamp'
		        text: [ :anEpEvent :anIndex | log timeAt: anEpEvent ];
		        actionButtonLabel: 'Apply'
		        tooltip: 'Apply Selected Changes'
		        action: [ :aButton | aButton phlow spawnObject: (GtEpiceaApplyAction on: selected) ];
		        actionButtonLabel: 'Revert'
		        tooltip: 'Revert Selected Changes'
		        action: [ :aButton | aButton phlow spawnObject: (GtEpiceaRevertAction on: selected) ];
		        actionDropdownButtonLabel: 'Filters'
		        tooltip: 'Apply and remove filters from the list'
		        content: [ :aDropdown :aTab | 
			        | filters aList aContainer |
			        selected := Set new.
			        aContainer := BrVerticalPane new fitContent
				                      alignCenterRight.
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
							        +
								        (BrGlamorousWithLabelTooltipAptitude new text:
										         'Select for Commit');
						        margin: (BlInsets left: 10);
						        whenCheckedDo: [ selected add: item ];
						        whenUncheckedDo: [ selected remove: item ] ].
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
							         newItems := self log entriesStream.
							         selected do: [ :aPragma | 
									         newItems := self
										                     perform: aPragma methodSelector
										                     withArguments: { newItems } ].
							         aTab viewContentElement children first children second 
								         itemsProvider: newItems asBrItemsProvider.
							         aButton fireEvent: BrDropdownHideWish new ]) ].
	^ view
]

{ #category : #accessing }
GtEpiceaLog >> latestFilter: aStream [
	<gtChangeFilter>

	^ aStream withoutDuplicatesBasedOn: [ :aChange | aChange content affectedMarker]
]

{ #category : #accessing }
GtEpiceaLog >> log [
	^ log
]

{ #category : #accessing }
GtEpiceaLog >> log: aLog [
	log := aLog
]

{ #category : #accessing }
GtEpiceaLog >> name [
	^ log store globalName
]

{ #category : #accessing }
GtEpiceaLog >> ombuFile: aFile [
	self log: (EpLog fromFile: aFile)
]

{ #category : #accessing }
GtEpiceaLog >> startTime [

	^ self log startTime
]
