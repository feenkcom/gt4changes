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
	aScripter
		substep: 'Click on changes'
		do: [ :aStep | 
			aStep check
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ].

			aStep click
				label: 'Click change expander';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				id: #toggle.

			aStep click
				label: 'Click first simple change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 2.

			aStep check
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	^ aScripter syncContinue
]

{ #category : #accessing }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedCompositeLog [
	<gtExample>
	| aScripter |
	aScripter := self scripterOnExpandedElement.
	aScripter
		substep: 'Click on changes'
		do: [ :aStep | 
			aStep check
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ].

			aStep click
				label: 'Click change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 1.

			aStep check
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	^ aScripter syncContinue
]

{ #category : #accessing }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedSimpleLog [
	<gtExample>
	<noTest>
	| aScripter |
	aScripter := self scripterOnExpandedElement.
	aScripter
		substep: 'Click on changes'
		do: [ :aStep | 
			aStep check
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ].

			aStep click
				label: 'Click change expander';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				id: #toggle.

			aStep click
				label: 'Click first simple change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 3.

			aStep check
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	^ aScripter syncContinue
]

{ #category : #accessing }
GtEpiceaElementExamples >> simpleElement [
	<gtExample>
	| element |
	element := GtEpiceaElement new.
	
	self assert: element change equals: nil.
	
	^ element
]
