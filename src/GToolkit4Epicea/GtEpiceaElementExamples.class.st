Class {
	#name : #GtEpiceaElementExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceaElementExamples >> expandedElement [
	<gtExample>
	| element |
	element := self simpleElement createInPager maximized.
	
	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElement [
	<gtExample>
	| aScripter |
	
	aScripter := BlScripter new.
	aScripter element: self expandedElement.
	
	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedActiveLog [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self scripterOnExpandedElement.

	aScripter check
		label: 'Check no change';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ];
		play.

	aScripter click
		label: 'Click change expander';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		id: #toggle;
		play.

	aScripter click
		label: 'Click active change';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		onChildAt: 2;
		play.

	aScripter check
		label: 'Check change selected';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ];
		play.

	aScripter check
		label: 'Check change selected';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isSimple ];
		play.

	aScripter check
		label: 'Check change is active';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isActive ];
		play.
		
	aScripter check
		label: 'Check change has a list view';
		satisfies: [ :aChangeView | 
			(((aChangeView pages last contentElement tool childNamed: #content)
				childNamed: #tabs) childNamed: #content)
				childNamed: #list
				ifFound: [ :element | element isKindOf: BrColumnedList ]
				ifNone: [ false ] ];
		play.

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedCompositeLog [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self scripterOnExpandedElement.

	aScripter check
		label: 'Check no change';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ];
		play.

	aScripter click
		label: 'Click change expander';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		id: #toggle;
		play.

	aScripter click
		label: 'Click composite change';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		onChildAt: 1;
		play.

	aScripter check
		label: 'Check change selected';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ];
		play.

	aScripter check
		label: 'Check change is composite';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isComposite ];
		play.

	aScripter check
		label: 'Check change has a list view';
		satisfies: [ :aChangeView | 
			(((aChangeView pages last contentElement tool childNamed: #content)
				childNamed: #tabs) childNamed: #content)
				childNamed: #list
				ifFound: [ :element | element isKindOf: BrColumnedList ]
				ifNone: [ false ] ];
		play.

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedSimpleLog [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self scripterOnExpandedElement.

	aScripter check
		label: 'Check no change';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ];
		play.

	aScripter click
		label: 'Click change expander';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		id: #toggle;
		play.

	aScripter click
		label: 'Click composite change';
		id: #sidebar;
		id: #content;
		id: #scrollable;
		onChildAt: 3;
		play.

	aScripter check
		label: 'Check change selected';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ];
		play.

	aScripter check
		label: 'Check change is composite';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isSimple ];
		play.

	aScripter check
		label: 'Check change is not active';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isActive not ];
		play.

	aScripter check
		label: 'Check change has a list view';
		satisfies: [ :aChangeView | 
			(((aChangeView pages last contentElement tool childNamed: #content)
				childNamed: #tabs) childNamed: #content)
				childNamed: #list
				ifFound: [ :element | element isKindOf: BrColumnedList ]
				ifNone: [ false ] ];
		play.
		
	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> simpleElement [
	<gtExample>
	| element |
	element := GtEpiceaElement new.
	
	self assert: element change equals: nil.
	
	^ element
]
