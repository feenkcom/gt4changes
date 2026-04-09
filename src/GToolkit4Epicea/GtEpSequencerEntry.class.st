Class {
	#name : #GtEpSequencerEntry,
	#superclass : #Object,
	#instVars : [
		'omEntry',
		'classification',
		'sortOrder'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'as yet unclassified' }
GtEpSequencerEntry >> applyCodeChange [

	^ omEntry applyCodeChange
]

{ #category : #accessing }
GtEpSequencerEntry >> classification [
	<return: #Symbol>
	
	^ classification
]

{ #category : #accessing }
GtEpSequencerEntry >> classification: aSymbol [
	"Set the receiver's classification.
	nil is allowed for serialisation."

	(#(#required #requiredMissingDependency #superseeded nil) includes: aSymbol) ifFalse:
		[ self error: 'Invalid classification: ', aSymbol printString ].

	classification := aSymbol
]

{ #category : #accessing }
GtEpSequencerEntry >> content [

	^ omEntry ifNotNil: #content
]

{ #category : #ui }
GtEpSequencerEntry >> gtCurrentSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'Current source';
		priority: 30;
		object: [ omEntry ];
		view: #gtCurrentSourceFor:
]

{ #category : #ui }
GtEpSequencerEntry >> gtDiffCurrentFor: aView [
	<gtView>

	^ aView forward
		title: 'Diff current';
		priority: 15;
		object: [ omEntry ];
		view: #gtDiffCurrentFor:
]

{ #category : #ui }
GtEpSequencerEntry >> gtDiffFor: aView [
	<gtView>

	^ aView forward
		title: 'Diff';
		priority: 10;
		object: [ omEntry ];
		view: #gtDiffFor:
]

{ #category : #ui }
GtEpSequencerEntry >> gtNewSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'New source';
		priority: 20;
		object: [ omEntry ];
		view: #gtNewSourceFor:
]

{ #category : #ui }
GtEpSequencerEntry >> gtOldSourceFor: aView [
	<gtView>

	^ aView forward
		title: 'Old source';
		priority: 25;
		object: [ omEntry ];
		view: #gtOldSourceFor:
]

{ #category : #accessing }
GtEpSequencerEntry >> gtTime [

	^ omEntry gtTime
]

{ #category : #accessing }
GtEpSequencerEntry >> gtTimeOrEpoch [

	^ omEntry gtTimeOrEpoch
]

{ #category : #ui }
GtEpSequencerEntry >> gtViewChangeDescriptionElements [
	^  self content 
			accept: GtEpiceaBrickVisitor new
]

{ #category : #accessing }
GtEpSequencerEntry >> gtViewChangeIcon [

	^ omEntry gtViewChangeIcon
	"^ classification = #superseeded ifTrue: 
		[ BrGlamorousVectorIcons interdiction]
	ifFalse: 
		[ Smalltalk ui icons iconNamed: (self content accept: GtEpReplayIconNameVisitor new) ]."
		"[ | impact |
		impact := self content accept: (GtEpReplayImpactVisitor inEnvironment: self class environment).
		impact = #hasImpact ifTrue: 
			[ Smalltalk ui icons iconNamed: (self content accept: GtEpReplayIconNameVisitor new) ]
		ifFalse: [ impact = #noImpact ifTrue:
			[ BrGlamorousVectorIcons yellowcircle ]
		ifFalse: [ impact = #invalid ifTrue:
			[ BrGlamorousVectorIcons redcircle ] ] ] ]"
]

{ #category : #ui }
GtEpSequencerEntry >> gtViewLatestChangeTime [
	^ self gtTime
]

{ #category : #'as yet unclassified' }
GtEpSequencerEntry >> hasImpact [

	^ omEntry hasImpact
]

{ #category : #testing }
GtEpSequencerEntry >> hasTime [

	^ omEntry hasTime
]

{ #category : #testing }
GtEpSequencerEntry >> isMissingDependency [
	"Answer a boolean indicating whether the receiver is classified as required but missing a dependency.
	Superseeded / not needed entries are never missing a dependency."

	^ classification == #requiredMissingDependency
]

{ #category : #testing }
GtEpSequencerEntry >> isRequired [
	"Answer a boolean indicating whether the receiver is required.
	nil = not required."

	^ #(#required #requiredMissingDependency) includes: classification
]

{ #category : #accessing }
GtEpSequencerEntry >> omEntry [
	^ omEntry
]

{ #category : #accessing }
GtEpSequencerEntry >> omEntry: anObject [
	omEntry := anObject
]

{ #category : #printing }
GtEpSequencerEntry >> printOn: aStream [

	aStream
		print: sortOrder;
		<< ': ';
		print: self content;
		<< '(';
		print: classification;
		<< ')'
]

{ #category : #accessing }
GtEpSequencerEntry >> sortOrder [
	^ sortOrder
]

{ #category : #accessing }
GtEpSequencerEntry >> sortOrder: anObject [
	sortOrder := anObject
]

{ #category : #accessing }
GtEpSequencerEntry >> tagAt: aSymbol [

	^ omEntry tagAt: aSymbol
]

{ #category : #accessing }
GtEpSequencerEntry >> tags [

	^ omEntry tags
]
