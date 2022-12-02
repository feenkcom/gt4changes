"
nil
"
Class {
	#name : #GtEpEventSequencerExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #'private - helpers' }
GtEpEventSequencerExamples class >> testDataRoot [

	^ FileLocator gtResource 
		/ 'feenkcom/gt4changes/data'
		/ self name.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameWithCurrent [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	fileReference := self class testDataRoot / 'Issue2924' / 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries includeCurrent: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 5.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameWithoutCurrent [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	fileReference := self class testDataRoot / 'Issue2924' / 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries includeCurrent: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 5.
]
