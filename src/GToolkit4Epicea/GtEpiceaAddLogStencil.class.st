Class {
	#name : #GtEpiceaAddLogStencil,
	#superclass : #BrStencil,
	#instVars : [
		'dropdown',
		'onCreated'
	],
	#category : #'GToolkit4Epicea-Element'
}

{ #category : #accessing }
GtEpiceaAddLogStencil >> create [

	| container button input label |
	label := BrLabel new.
	label
		aptitude: BrGlamorousLabelAptitude new bold;
		text: 'Add new Log';
		margin: (BlInsets bottom: 5).

	input := BrEditableLabel new
		         aptitude:
			         BrGlamorousEditableLabelAptitude new
				         glamorousRegularFontAndSize;
		         text: '';
		         switchToEditor;
		         hMatchParent;
		         vExact: 23;
		         constraintsDo: [ :c | c grid vertical alignCenter ].

	button := BrButton new
		          aptitude: BrGlamorousButtonWithIconAptitude;
		          icon: BrGlamorousVectorIcons accept;
		          action: [ 
			          | change name |
			          name := input text asString.
			          change := name
				                    ifEmpty: [ EpMonitor current basicLog ]
				                    ifNotEmpty: [ 
					                    EpLog newWithStore: (OmFileStore
								                     named: input text asString
								                     inDirectory:
									                     EpMonitor current sessionStore
										                     baseLocator) ].
			          EpMonitor current: (EpMonitor newWithLog: change).
			          dropdown ifNotNil: [ 
					          dropdown enqueueTask: (BlTaskAction new action: [ 
									           dropdown dispatchEvent:
											           (BrDropdownHideWish new anchor: dropdown) ]) ].
			          onCreated value: (GtEpicea new log: change) ].

	container := BrVerticalPane new vFitContent
		             width: 150;
		             padding: (BlInsets all: 5).
	container addChild: label.
	container addChild: (BrHorizontalPane new matchParent
			 margin: (BlInsets bottom: 5);
			 addChild: (BrLabel new
					  aptitude: BrGlamorousLabelAptitude;
					  text: 'Name');
			 addChild: input).
	container addChild: (BrHorizontalPane new matchParent
			 layout: BlLinearLayout horizontal alignCenterRight;
			 addChild: button).
	^ container
]

{ #category : #accessing }
GtEpiceaAddLogStencil >> dropdown: aDropdown [
	dropdown := aDropdown
]

{ #category : #accessing }
GtEpiceaAddLogStencil >> onCreated: aBlock [
	onCreated := aBlock
]
