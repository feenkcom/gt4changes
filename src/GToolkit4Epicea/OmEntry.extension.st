Extension { #name : #OmEntry }

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
