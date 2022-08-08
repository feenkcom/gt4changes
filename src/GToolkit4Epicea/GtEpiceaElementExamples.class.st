Class {
	#name : #GtEpiceaElementExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #accessing }
GtEpiceaElementExamples >> expandedElement [
	<gtExample>
	| element |
	element := self simpleElement createInPager maximized.
	
	^ element
]

{ #category : #accessing }
GtEpiceaElementExamples >> scripterFreezeLog [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self scripterOnExpandedElementWithSelectedSimpleLog.
	aScripter
		substep: 'Click on freeze button'
		do: [ :aStep | 
			aStep check
				label: 'Check change not frozen';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isFrozen not ].

			aStep click
				label: 'Click button';
				id: #content;
				id: #toolbar;
				onChildAt: 1.

			aStep check
				label: 'Check change frozen';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isFrozen ] ].

	^ aScripter syncContinue
]

{ #category : #accessing }
GtEpiceaElementExamples >> scripterOnExpandedElement [
	<gtExample>
	| aScripter |
	
	aScripter := BlDevScripter new.
	aScripter element: self expandedElement.
	
	^ aScripter
]

{ #category : #accessing }
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

	^ aScripter
]

{ #category : #accessing }
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

	^ aScripter
]

{ #category : #accessing }
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

	^ aScripter
]

{ #category : #accessing }
GtEpiceaElementExamples >> simpleElement [
	<gtExample>
	| element |
	element := GtEpiceaElement new.
	
	self assert: element change equals: nil.
	
	^ element
]
