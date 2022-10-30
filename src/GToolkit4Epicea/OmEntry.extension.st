Extension { #name : #OmEntry }

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtActionApplyFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	^ anAction button
		label: 'Apply';
		action: [ :button | self content applyCodeChange ]
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
OmEntry >> gtActionRevertFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	^ anAction button
		label: 'Revert';
		action: [ :button | self content asRevertedCodeChange applyCodeChange ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtDiffFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Diff';
		priority: 1;
		stencil: [
			| previousContent newContent |
			previousContent := self content accept:  EpOldStateVisitor new.
			newContent := self content accept: EpNewStateVisitor new.
			
			GtEpiceaDiffElementWithLabelStencil new
			 	fromLabelText: 'Current:';
			 	toLabelText:  'Change:';
			 	ombuEntry: self;
			 	shouldHideDiff: (previousContent = newContent);
			 	diffBuilder: ((GtCodeDiffBuilder 
			 		from: previousContent
			 		to: newContent) 
			 			isMethod: self content isEpMethodChange) ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtNewSourceFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'New Source';
		aptitude: BrGlamorousCodeEditorAptitude;
		styler: (GtCodeDiffRBTextStyler new 
			isForWorkspace: (self content isEpMethodChange not));
		priority: 41;
		text: [ self content accept: EpNewStateVisitor new ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtOldSourceFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Old Source';
		aptitude: BrGlamorousCodeEditorAptitude;
		styler: (GtCodeDiffRBTextStyler new 
			isForWorkspace: (self content isEpMethodChange not));
		priority: 42;
		text: [ self content accept: EpOldStateVisitor new ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtTagsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'Tags';
		priority: 45;
		object: [ tags ]
]
