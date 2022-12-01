Class {
	#name : #GtEpiceaShowAction,
	#superclass : #GtEpiceaAction,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaShowAction >> asView [

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

	self events ifEmpty: [ 
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

	^ aContainer
]

{ #category : #accessing }
GtEpiceaShowAction >> asViewFor: aLog [
	| aList |
	aList := BrColumnedList new matchParent.

	aList column
		title: 'Icon';
		stencil: [ :anEpEvent :anIndex | (anEpEvent content accept: EpIconVisitor new) asElement ];
		width: 32.
	aList column
		title: 'Description';
		matchParent;
		stencil: [ :anEpEvent :anIndex | 
			BlElement new
				layout: BlLinearLayout horizontal;
				addChildren: (anEpEvent content accept: GtEpiceaBrickVisitor new);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ] ].
	aList column
		width: 250;
		title: 'Timestamp';
		cellStencil: [ :each | BrLabel new aptitude: BrGlamorousLabelAptitude new ];
		dataBinder: [ :aLabel :anEpEvent | aLabel text: (aLog timeAt: anEpEvent) asString ].

	aList
		when: BrSelectionChanged
		do: [ :anEvent | 
			anEvent indices
				ifNotEmpty: [ | aWidgetElement selectedObject |
					aWidgetElement := anEvent currentTarget.
					selectedObject := aWidgetElement viewModel itemAt: anEvent indices first.
					aList phlow spawnObject: selectedObject ] ].

	aList addAptitude: BrColumnedListHeaderAptitude.
	
	aList items: self events.
	
	^ aList
]
