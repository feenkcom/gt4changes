Extension { #name : #OmEntry }

{ #category : #'*GToolkit4Epicea' }
OmEntry >> applyCodeChange [

	^ content applyCodeChange
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> applyCodeChangeIfHasImpact [

	^ content applyCodeChangeIfHasImpact
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtActionApplyFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	^ anAction button
		label: 'Apply';
		priority: 1;
		action: [ :button | self applyCodeChange ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtActionBrowseEntryFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	(self content isKindOf: EpMethodChange)
		ifTrue: [ 
			^ anAction button
				label: 'Browse';
				priority: 3;
				tooltip: 'Browse current version of this method';
				action: [ :aButton | 
					aButton phlow spawnTool: (GtMethodCoderTool compiledMethod:
						self content methodAffected compiledMethod)  ] ].

	(self content isEpBehaviorChange)
		ifTrue: [ 
			^ anAction button
				label: 'Browse';
				priority: 3;
				tooltip: 'Browse current version of this class';
				action: [ :aButton | 
					aButton phlow spawnTool: (GtClassCoderTool forClass:
						self content behaviorAffected realClass) ] ].

	^ anAction noAction
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtActionRevertFor: anAction [
	<gtAction>
	self content isCodeChange ifFalse: [ ^ anAction noAction ].

	^ anAction button
		label: 'Revert';
		priority: 2;
		action: [ :button | self content asRevertedCodeChange applyCodeChange ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtCurrentSourceFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Current source';
		aptitude: BrGlamorousCodeEditorAptitude;
		styler: (GtCodeDiffRBTextStyler new 
			isForWorkspace: (self content isEpMethodChange not));
		priority: 43;
		text: [ self content accept: (GtEpiceaCurrentStateVisitor
			inEnvironment: self class environment
			showClassName: false) ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtDiffCurrentFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff current';
		priority: 5;
		stencil: [ | previousContent newContent change styler |
			previousContent := self content
					accept: (GtEpiceaCurrentStateVisitor
							inEnvironment: self class environment
							showClassName: false).
			newContent := self content accept: EpNewStateVisitor new.

			change := GtDiffBuilder
					computeDifferencesFrom: previousContent
					to: newContent
					using: GtSmaCCDiffSplitter forPharo.
			GtEpiceaDiffElementWithLabelStencil new
				fromLabelText: 'Current:';
				toLabelText: 'Change:';
				ombuEntry: self;
				shouldHideDiff: previousContent = newContent;
				change: change;
				styler: (GtCodeDiffRBTextStyler new isForWorkspace: self content isEpMethodChange not) ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtDiffFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff';
		priority: 1;
		stencil: [ | previousContent newContent change |
			previousContent := self content accept: EpOldStateVisitor new.
			newContent := self content accept: EpNewStateVisitor new.

			change := GtDiffBuilder
					computeDifferencesFrom: previousContent
					to: newContent
					using: GtSmaCCDiffSplitter forPharo.
			GtEpiceaDiffElementWithLabelStencil new
				fromLabelText: 'Current:';
				toLabelText: 'Change:';
				ombuEntry: self;
				change: change;
				styler: (GtCodeDiffRBTextStyler new isForWorkspace: self content isEpMethodChange not) ]
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtEntityLabel [
	^ content gtDisplayString
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtNewSourceFor: aView [
	<gtView>
	
	^ aView textEditor
		title: 'New source';
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
		title: 'Old source';
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

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtTime [
	^ self tagAt: EpLog timeKey
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtViewChangeDescriptionElements [
	^  self content 
			accept: GtEpiceaBrickVisitor new
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtViewChangeHistoryChildren [
	^ #()
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtViewChangeIcon [
	^  GtEpicea iconForEpiceaChange: self content 
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> gtViewLatestChangeTime [
	^ self gtTime
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> hasImpact [

	^ content hasImpact
]

{ #category : #'*GToolkit4Epicea' }
OmEntry >> hasTime [
	^ self tags includesKey: #time
]
