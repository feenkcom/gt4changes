Extension { #name : #OmEntry }

{ #category : #'*GToolkit4Epicea' }
OmEntry >> diffElements [

	| elements previous builder new element |
	elements := OrderedCollection new.

	previous := self content accept:
		            EpOldStateVisitor new.
	new := self content accept: EpNewStateVisitor new.
	previous = new ifFalse: [ 
		builder := (GtEpiceaDiffBuilder from: previous to: new) isMethod:
			           (self content isEpMethodChange).
		element := BrVerticalPane new.
		element margin: (BlInsets all: 3).
		element hMatchParent.
		element vFitContent.
		element addChild:
			((GtEpiceaDiffElement on: builder) aptitude: GtDiffFlatAptitude)
				vFitContent beSmallSize.
		element addChild: (BrButton new
				 aptitude: BrGlamorousButtonWithIconAptitude;
				 icon: BrGlamorousVectorIcons accept;
				 label: 'Accept';
				 margin: (BlInsets
						  top: 0
						  left: 5
						  bottom: 5
						  right: 0);
				 action: [ self content applyCodeChange ]).
		element addAptitude: (BrShadowAptitude new width: 1).
		elements add: element ].
	^ elements
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtActionBrowseEntryFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	(self content isKindOf: EpMethodChange)
		ifTrue: [ ^ anAction button
				label: 'Browse';
				action: [ :button | self content methodAffected compiledMethod gtBrowseFrom: button ] ].

	(self content isKindOf: EpClassChange)
		ifTrue: [ ^ anAction button
				label: 'Browse';
				action: [ :button | self content behaviorAffected realClass gtBrowseFrom: button ] ].

	^ anAction noAction
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtDiffFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff';
		priority: 1;
		stencil: [ | element headerElement label diffElement |
			element := BrVerticalPane new.
			element matchParent.
			headerElement := BrHorizontalPane new
					padding: (BlInsets all: 0);
					hMatchParent;
					vFitContent.
			label := BrLabel new.
			label
				text: ('Current:' asRopedText glamorousCodeSmallSize
						foreground: BrGlamorousColors defaultButtonTextColor).
			label margin: (BlInsets left: 15).
			label hMatchParent.
			headerElement addChild: label.
			headerElement
				addChild: (BlElement new
						height: 0;
						width: 15;
						yourself).
			label := BrLabel new.
			label
				text: ('Change:' asRopedText glamorousCodeSmallSize
						foreground: BrGlamorousColors defaultButtonTextColor).
			label hMatchParent.
			headerElement addChild: label.
			element addChild: headerElement.
			diffElement := BrVerticalPane new.
			diffElement hMatchParent.
			diffElement vFitContent.
			diffElement addChildren: self diffElements.
			element addChild: diffElement asScrollableElement.
			element ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtNewSourceFor: aView [
	<gtView>
	^ aView textEditor
		title: 'New Source';
		aptitude: BrGlamorousCodeEditorAptitude;
		styler: (GtEpiceaRBTextStyler new isForWorkspace: (self content isEpMethodChange not));
		priority: 41;
		text: [ self content accept: EpNewStateVisitor new ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtOldSourceFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Old Source';
		aptitude: BrGlamorousCodeEditorAptitude;
		styler: (GtEpiceaRBTextStyler new isForWorkspace: (self content isEpMethodChange not));
		priority: 42;
		text: [ self content accept: EpOldStateVisitor new ]
]
