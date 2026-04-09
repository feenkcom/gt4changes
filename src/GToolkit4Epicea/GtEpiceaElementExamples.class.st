Class {
	#name : #GtEpiceaElementExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #examples }
GtEpiceaElementExamples >> elementWithChange [
	<gtExample>
	<return: #GtEpiceaElement>
	| element |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self simpleElement change: GtEpiceaExplicitLogExamples new simpleLog.

	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElement [
	<gtExample>
	<return: #GtPager>
	| element |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self simpleElement createInPager maximized.

	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithChange [
	<gtExample>
	<return: #GtPager>
	| element |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self elementWithChange createInPager maximized.

	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithDeletedChange [
	<gtExample>
	<return: #BlScripter>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self expandedElementWithDeletionDialog.

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on remove button';
				onSpaceRoot;
				id: #'change-button-action' ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check no change';
				satisfies: [ :aPaneElement | aPaneElement realToolElement change isNil ];
				// #'maximizer--overlay';
				// GtTreePagerPaneContentElement ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithDeletionDialog [
	<gtExample>
	<return: #BlScripter>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self scripterOnExpandedElementWithChange.

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click change deletion button';
				id: #content;
				id: #removebtn ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElement [
	<gtExample>
	<return: #BlScripter>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := BlScripter new.
	aScripter element: self expandedElement.

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithChange [
	<gtExample>
	<return: #BlScripter>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := BlScripter new.
	aScripter element: self expandedElementWithChange.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change';
				satisfies: [ :aPaneElement | aPaneElement realToolElement change isNotNil ];
				// #'maximizer--overlay';
				// GtTreePagerPaneContentElement ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change name';
				satisfies: [ :aPaneElement | 
					((aPaneElement realToolElement childNamed: #title) childAt: 1)
						text asString = 'Explicit log on 0 entries' ];
				// #'maximizer--overlay';
				// GtTreePagerPaneContentElement ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedActiveLog [
	<gtExample>
	<noTest>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self scripterOnExpandedElement.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ] ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click change expander';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				id: #toggle ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click active change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 2 ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isSimple ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change is active';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isActive ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change has a list view';
				satisfies: [ :aChangeView | 
					(((aChangeView pages last contentElement tool childNamed: #content)
						childNamed: #tabs) childNamed: #content)
						childNamed: #list
						ifFound: [ :element | element isKindOf: BrColumnedList ]
						ifNone: [ false ] ] ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedCompositeLog [
	<gtExample>
	<noTest>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self scripterOnExpandedElement.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ] ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click change expander';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				id: #toggle ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click composite change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 1 ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change is composite';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isComposite ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change has a list view';
				satisfies: [ :aChangeView | 
					(((aChangeView pages last contentElement tool childNamed: #content)
						childNamed: #tabs) childNamed: #content)
						childNamed: #list
						ifFound: [ :element | element isKindOf: BrColumnedList ]
						ifNone: [ false ] ] ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElementWithSelectedSimpleLog [
	<gtExample>
	<noTest>
	| aScripter |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self scripterOnExpandedElement.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check no change';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ] ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click change expander';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				id: #toggle ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click composite change';
				id: #sidebar;
				id: #content;
				id: #scrollable;
				onChildAt: 3 ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change selected';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change is composite';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isSimple ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change is not active';
				satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isActive not ] ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check change has a list view';
				satisfies: [ :aChangeView | 
					(((aChangeView pages last contentElement tool childNamed: #content)
						childNamed: #tabs) childNamed: #content)
						childNamed: #list
						ifFound: [ :element | element isKindOf: BrColumnedList ]
						ifNone: [ false ] ] ].

	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> simpleElement [
	<gtExample>
	<return: #GtEpiceaElement>
	| element |
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := GtEpiceaElement new.

	self assert: element change equals: nil.

	^ element
]
