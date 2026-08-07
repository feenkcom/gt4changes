"
Abstract explanation object describing why a {{gtClass:GtEpSequencerEntry}} received its classification.
"
Class {
	#name : #GtEpSequencerEntryReason,
	#superclass : #Object,
	#instVars : [
		'imageModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpSequencerEntryReason >> explanation [
	^ self label
]

{ #category : #'gt-extensions' }
GtEpSequencerEntryReason >> gtSummaryFor: aView [
	<gtView>
	^(aView columnedList)
		title: 'Summary';
		priority: 10;
		items: [ self summaryAttributes ];
		column: #Attribute text: [:item | item first];
		column: #Value text: [:item | item second];
		actionUpdateButton
]

{ #category : #accessing }
GtEpSequencerEntryReason >> imageModel [
	^imageModel
]

{ #category : #accessing }
GtEpSequencerEntryReason >> imageModel: anObject [
	imageModel := anObject
]

{ #category : #accessing }
GtEpSequencerEntryReason >> kind [
	self subclassResponsibility
]

{ #category : #accessing }
GtEpSequencerEntryReason >> label [
	^ self kind asString
]

{ #category : #printing }
GtEpSequencerEntryReason >> printOn: aStream [
	aStream nextPutAll: self explanation
]

{ #category : #accessing }
GtEpSequencerEntryReason >> relatedEntries [
	^ #()
]

{ #category : #'gt-extensions' }
GtEpSequencerEntryReason >> summaryAttributes [
	| attributes |

	attributes := OrderedCollection new.
	attributes
		add: { 'Kind'. self kind };
		add: { 'Label'. self label };
		add: { 'Explanation'. self explanation };
		add: { 'Related entries'. self relatedEntries size}.
	self relatedEntries doWithIndex: [ :entry :index |
		attributes add: { index. entry. } ].
	^ attributes
]
