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
	| element |

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self simpleElement change: (GtEpiceaExplicitLogExamples new simpleLog).
	
	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElement [
	<gtExample>
	| element |

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self simpleElement createInPager maximized.
	
	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithChange [
	<gtExample>
	| element |

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := self elementWithChange createInPager maximized.
	
	^ element
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithDeletedChange [
	<gtExample>
	| aScripter |
	
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self expandedElementWithDeletionDialog.
	
	aScripter click
		label: 'Click on remove button';
		onSpaceRoot;
		id: #'change-button-action';
		play.
		
	aScripter check
		label: 'Check no change';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNil ];
		play.
	
	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> expandedElementWithDeletionDialog [
	<gtExample>
	| aScripter |
	
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := self scripterOnExpandedElementWithChange.
	
	aScripter click
		label: 'Click change deletion button';
		id: #content;
		id: #removebtn;
		play.
	
	^ aScripter
]

{ #category : #examples }
GtEpiceaElementExamples >> scripterOnExpandedElement [
	<gtExample>
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
	| aScripter |
	
	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	aScripter := BlScripter new.
	aScripter element: self expandedElementWithChange.
		
	aScripter check
		label: 'Check change';
		satisfies: [ :aChangeView | aChangeView pages last contentElement tool change isNotNil ];
		play.
			
	aScripter check
		label: 'Check change name';
		satisfies: [ :aChangeView | ((aChangeView pages last contentElement tool childNamed: #title) childAt: 1) text asString = 'Explicit log on 0 entries' ];
		play.
	
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

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

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

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

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

	"This example assumes an on-disk Epicea store"
	EpMonitor current sessionStore isMemoryStore ifTrue: [ ^ self ].

	element := GtEpiceaElement new.
	
	self assert: element change equals: nil.
	
	^ element
]
