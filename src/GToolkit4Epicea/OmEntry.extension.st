Extension { #name : #OmEntry }

{ #category : #'*GToolkit4Epicea' }
OmEntry >> diffElements [

	| elements previous builder new element |
	elements := OrderedCollection new.

	previous := self content accept:
		            ((GtEpiceaCurrentStateVisitor inEnvironment:
			              self class environment) showClassNameInMethodSource:
			             false).
	new := self content accept: EpNewStateVisitor new.
	previous = new ifFalse: [ 
		builder := (GtEpiceaDiffBuilder from: previous to: new) isMethod:
			           (self content isKindOf: EpMethodChange).
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
OmEntry >> gtDiffFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff';
		stencil: [
			  | element headerElement label diffElement |
			  element := BrVerticalPane new.
			  element matchParent.
			  headerElement := BrHorizontalPane new
				                   padding: (BlInsets all: 0);
				                   hMatchParent;
				                   vFitContent.
			  label := BrLabel new aptitude: BrGlamorousLabelAptitude.
			  label text:
				  ('Current:' asRopedText glamorousCodeSmallSize foreground:
					   BrGlamorousColors defaultButtonTextColor).
			  label margin: (BlInsets left: 15).
			  label hMatchParent.
			  headerElement addChild: label.
			  headerElement addChild: (BlElement new
					   height: 0;
					   width: 15;
					   yourself).
			  label := BrLabel new aptitude: BrGlamorousLabelAptitude.
			  label text:
				  ('Change:' asRopedText glamorousCodeSmallSize foreground:
					   BrGlamorousColors defaultButtonTextColor).
			  label hMatchParent.
			  headerElement addChild: label.
			  element addChild: headerElement.
			  diffElement := BrVerticalPane new.
			  diffElement hMatchParent.
			  diffElement vFitContent.
			  diffElement addChildren: self diffElements.
			  element addChild: diffElement asScrollableElement.
			  element]
]