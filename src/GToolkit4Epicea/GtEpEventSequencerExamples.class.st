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

{ #category : #private }
GtEpEventSequencerExamples class >> removeTestClasses [

	EpMonitor disableDuring:
		[ #(#Issue2924 #Issue2924Renamed #Issue2936 #Issue2936Renamed
		#Issue2936 #Issue2936v2 
		#Issue2936v4 #Issue2936v41 #Issue2936v42 #Issue2936v43
		#Issue2936v5 #Issue2936v51 #Issue2936v52
		#Issue2961 #Issue2961Class #Issue2961Renamed
		#Issue3398RootClass #Issue3398Subclass #Issue3398RootClassRenamed
		#Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2
		#Issue3420Superclass #Issue3420Subclass 
		#Issue3490RootClass #Issue3490SubClass
		#Issue3491RootClass #Issue3491SubClass
		#GtEpEventSequencerExampleCheck
		#GtEpEventSequencerExampleClass1
		#GtEpEventSequencerExampleClass2
		#GtEpEventSequencerExampleClass3) do: [ :each |
			self class environment removeClassNamed: each ].
		self class environment organization
			removeCategory: #Issue2924;
			removeCategory: #Issue2936;
			removeCategory: #Issue2936v2;
			removeCategory: #Issue2936v4;
			removeCategory: #Issue2936v41;
			removeCategory: #Issue2936v5;
			removeCategory: #Issue2961;
			removeCategory: #Issue3398;
			removeCategory: #Issue3399;
			removeCategory: #Issue3420;
			removeCategory: #Issue3490;
			removeCategory: #Issue3491;
			removeCategory: #GtEpEventSequencerExampleChecks ].
]

{ #category : #'private - helpers' }
GtEpEventSequencerExamples class >> testDataRoot [

	^ FileLocator gtResource 
		/ 'feenkcom/gt4changes/data'
		/ self name.
]

{ #category : #examples }
GtEpEventSequencerExamples >> behaviorRenameWithoutDependentsForExport [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961ClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue2961TraitRenamed).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> behaviorRenameWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961ClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue2961TraitRenamed).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> changeSuperclassForExport [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self removeTestClasses.
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3530' / 'Issue3530-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Get the system to the initial state"
	EpMonitor disableDuring:
		[ (entries first: 3) do: [ :each | each content applyCodeChange ] ].

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 1.
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2) superclassName equals: #Object.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> changeSuperclassInImage [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self removeTestClasses.
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3530' / 'Issue3530-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Get the system to the initial state"
	EpMonitor disableDuring:
		[ (entries first: 3) do: [ :each | each content applyCodeChange ] ].

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 1.
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2) superclassName equals: #Object.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries visitor |

	self deny: (self class environment includesKey: #Issue2924).
	fileReference := self class testDataRoot / 'Issue2924' / 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 4.
	visitor := sequencer visitor.
	self deny: (visitor image behaviors includesKey: #Issue2924).
	self assert: (visitor image behaviors includesKey: #Issue2924Renamed).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameInImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2924).
	fileReference := self class testDataRoot / 'Issue2924' / 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodModification #EpBehaviorNameChange #EpMethodAddition).
	self deny: (sequencer image behaviors includesKey: #Issue2924).
	self assert: (sequencer image behaviors includesKey: #Issue2924Renamed).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed1ForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodModification #EpClassModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed1InImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodModification #EpClassModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed2ForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3.ombu'.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 16.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed2InImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3.ombu'.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 16.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v4 #Issue2936v41 #Issue2936v42 #Issue2936v43) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-4' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals:11.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassModification #EpBehaviorCategoryChange #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v4).
	self deny: (sequencer image behaviors includesKey: #Issue2936v41).
	self deny: (sequencer image behaviors includesKey: #Issue2936v42).
	self assert: (sequencer image behaviors includesKey: #Issue2936v43).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v43.
	self assert: behavior package name equals: 'Issue2936v41'.
	self assert: behavior instVarNames equals: #(#iv1).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleInImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	#(#Issue2936 #Issue2936v4 #Issue2936v41 #Issue2936v42 #Issue2936v43) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-4' / 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals:11.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 4.
	self deny: (sequencer image behaviors includesKey: #Issue2936v4).
	self deny: (sequencer image behaviors includesKey: #Issue2936v41).
	self deny: (sequencer image behaviors includesKey: #Issue2936v42).
	self assert: (sequencer image behaviors includesKey: #Issue2936v43).

	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v43.
	self assert: behavior package name equals: 'Issue2936v41'.
	self assert: behavior instVarNames equals: #(#iv1).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameForExport [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition #EpMethodRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameInImage [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemove2ForExport [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtGemStoneCodeSyncExampleClassRenamed).
	self deny: (self class environment includesKey: #GtGemStoneCodeSyncExampleClassRenamed).
	fileReference := self class testDataRoot / 'Issue3487' / 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 16.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpClassRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemove2InImage [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtGemStoneCodeSyncExampleClassRenamed).
	self deny: (self class environment includesKey: #GtGemStoneCodeSyncExampleClassRenamed).
	fileReference := self class testDataRoot / 'Issue3487' / 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 16.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries isEmpty.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemoveForExport [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 22.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpClassRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemoveInImage [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 22.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: sequencedEntries isEmpty.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddWithoutDependentsForExport [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961Class).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961Class).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithSuperclassMethodModificationForExport [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithSuperclassMethodModificationInImage [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithoutSuperclassForExport [
	"Check that adding a class when one of the superclasses is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpClassAddition #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithoutSuperclassInImage [
	"Check that adding a class when one of the superclasses is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAndTraitRemovalWithoutDependentsForExport [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 30.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval #EpTraitRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAndTraitRemovalWithoutDependentsInImage [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 30.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classHierarchyAdditionForExport [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck2).
	fileReference := self class testDataRoot / 'Issue3171' / 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classHierarchyAdditionInImage [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck2).
	fileReference := self class testDataRoot / 'Issue3171' / 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classModifyRenameForExport [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries third content applyCodeChange.
		entries fifth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	"Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods reject: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#method1 #method2 #renamed) asSet.
	"Removed Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods select: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#anotherMethodToBeRenamed) asSet.
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition #EpMethodRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classModifyRenameInImage [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries third content applyCodeChange.
		entries fifth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	"Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods reject: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#method1 #method2 #renamed) asSet.
	"Removed Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods select: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#anotherMethodToBeRenamed) asSet.
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassModification #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classProtocolRemovalForExport [
	"Check that class side protocol removal is sequenced correctly.
	#classMethod1 is removed manually, and the protocol automatically.
	#cp2 is removed manually, automatically removing #classMethod2."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2958' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2958).
	behavior := sequencer image classOrTraitNamed: #Issue2958.
	self assert: behavior methods keys isEmpty.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpMethodRemoval #EpMethodRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classProtocolRemovalInImage [
	"Check that class side protocol removal is sequenced correctly.
	#classMethod1 is removed manually, and the protocol automatically.
	#cp2 is removed manually, automatically removing #classMethod2."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries behavior |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2958' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2958).
	behavior := sequencer image classOrTraitNamed: #Issue2958.
	self assert: behavior methods keys isEmpty.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRefactoringExistingInImage [
	"Check that a class refactirubg is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-6' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 7.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries last content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRefactoringInImage [
	"Check that a class refactirubg is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936-6' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 7.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingCommentForExport [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-9' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries third content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassAddition #EpBehaviorCommentChange #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingCommentInImage [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-9' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries third content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	self 
		assert: sequencedClassNames 
		equals: #(#EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingMethodForExport [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-8' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries fourth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	methodNames := (sequencer image behaviorAt: #Issue2936v1) methods keys.
	self assert: methodNames asSet equals: #(#method1) asSet.
	self 
		assert: sequencedClassNames 
		equals: #(#EpClassAddition #EpMethodModification #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingMethodInImage [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-8' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries fourth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ].
	methodNames := (sequencer image behaviorAt: #Issue2936v1) methods keys.
	self assert: methodNames asSet equals: #(#method1) asSet.
	self 
		assert: sequencedClassNames 
		equals: #(#EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingSubclassForExport [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Get the system to the initial state"
	EpMonitor disableDuring:
		[ entries do: [ :each | each content applyCodeChange ] ].

	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-2.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 2.
	self assert: (sequencer image behaviors includesKey: #GtEpEventSequencerExampleClass1rename).
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2) superclassName equals: #GtEpEventSequencerExampleClass1rename.
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass3) superclassName equals: #GtEpEventSequencerExampleClass1rename.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingSubclassInImage [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Get the system to the initial state"
	EpMonitor disableDuring:
		[ entries do: [ :each | each content applyCodeChange ] ].

	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-2.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 2.
	self assert: (sequencer image behaviors includesKey: #GtEpEventSequencerExampleClass1rename).
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2) superclassName equals: #GtEpEventSequencerExampleClass1rename.
	self assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass3) superclassName equals: #GtEpEventSequencerExampleClass1rename.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsForExport [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 15.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpBehaviorCommentChange #EpMethodRemoval #EpMethodModification).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsInImage [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 15.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpBehaviorCommentChange #EpMethodModification).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsRemovalForExport [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 19.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image classOrTraitNamed: #Issue2936v2) isRemoved.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsRemovalInImage [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2' / 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 19.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image classOrTraitNamed: #Issue2936v2) isRemoved.
	self assert: sequencedEntries isEmpty.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodAddWithoutDependentsForExport [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961Class).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpMethodAddition #EpMethodAddition #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodAddWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961Class).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodRemovalWithoutDependentsForExport [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961ClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue2961TraitRenamed).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpMethodRemoval #EpMethodRemoval #EpMethodRemoval #EpMethodRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodRemovalWithoutDependentsInImage [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #Issue2961ClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue2961TraitRenamed).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> modifyMethodChangeProtocolForExport [
	"Check that moving a method to another protocol is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	fileReference := self class testDataRoot / 'Issue2991' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries fourth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 2.
	self assert: sequencedEntries first identicalTo: entries second.
	self assert: sequencedEntries second identicalTo: entries last.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> modifyMethodChangeProtocolInImage [
	"Check that moving a method to another protocol is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	fileReference := self class testDataRoot / 'Issue2991' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	"Add the class and method1 to the system"
	EpMonitor disableDuring:
		[ entries second content applyCodeChange.
		entries fourth content applyCodeChange ].
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 1.
	self assert: sequencedEntries first identicalTo: entries last.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeExistingClassForExport [
	"Check that removing a class that is already in the image is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961).
	fileReference := self class testDataRoot / 'Issue2961-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.
	EpMonitor disableDuring: [ entries do: [ :entry |
		entry content applyCodeChange ] ].
	self assert: (self class environment includesKey: #Issue2961).

	fileReference := self class testDataRoot / 'Issue2961-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeExistingClassInImage [
	"Check that removing a class that is already in the image is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2961).
	fileReference := self class testDataRoot / 'Issue2961-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.
	EpMonitor disableDuring: [ entries do: [ :entry |
		entry content applyCodeChange ] ].
	self assert: (self class environment includesKey: #Issue2961).

	fileReference := self class testDataRoot / 'Issue2961-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeMethodAndClassForExport [
	"Check that a method and class remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	#(#Issue2936) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-7' / 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Issue2936) isRemoved.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).

	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeMethodAndClassInImage [
	"Check that a method and class remove is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	#(#Issue2936) do: [ :each |
		self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-7' / 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Issue2936) isRemoved.
	self assert: sequencedEntries isEmpty.

	^ sequencer.
]

{ #category : #private }
GtEpEventSequencerExamples >> removeTestClasses [

	self class removeTestClasses.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAddAndRenameForExport [
	"Check that a superclass add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheckSub).
	fileReference := self class testDataRoot / 'Issue3259' / 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAddAndRenameInImage [
	"Check that a superclass add and rename is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #GtEpEventSequencerExampleCheckSub).
	fileReference := self class testDataRoot / 'Issue3259' / 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsDownForExport [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclass1Behavior subclass2Behavior |

	self deny: (self class environment includesKey: #Issue3399RootClass).
	self deny: (self class environment includesKey: #Issue3399Subclass1).
	self deny: (self class environment includesKey: #Issue3399Subclass2).
	
	fileReference := (self class testDataRoot / 'Issue3399' / 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	
	self assert: (sequencer image behaviors includesKey: #Issue3399RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass1).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass2).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassModification #EpMethodAddition #EpMethodModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3399RootClass #Issue3399Subclass1 #Issue3399RootClass #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2 #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	rootClassBehavior := self class environment classOrTraitNamed: #Issue3399RootClass.
	self assert: rootClassBehavior instVarNames equals: #(#c).
	
	subclass1Behavior := self class environment classOrTraitNamed: #Issue3399Subclass1.
	self assert: subclass1Behavior instVarNames equals: #(#a #b).
	
	subclass2Behavior := self class environment classOrTraitNamed: #Issue3399Subclass2.
	self assert: subclass2Behavior instVarNames equals: #(#a #b).
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsDownInImage [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclass1Behavior subclass2Behavior |

	self deny: (self class environment includesKey: #Issue3399RootClass).
	self deny: (self class environment includesKey: #Issue3399Subclass1).
	self deny: (self class environment includesKey: #Issue3399Subclass2).
	
	fileReference := (self class testDataRoot / 'Issue3399' / 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	
	self assert: (sequencer image behaviors includesKey: #Issue3399RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass1).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass2).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassModification #EpMethodAddition #EpMethodModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3399RootClass #Issue3399Subclass1 #Issue3399RootClass #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2 #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	rootClassBehavior := self class environment classOrTraitNamed: #Issue3399RootClass.
	self assert: rootClassBehavior instVarNames equals: #(#c).
	
	subclass1Behavior := self class environment classOrTraitNamed: #Issue3399Subclass1.
	self assert: subclass1Behavior instVarNames equals: #(#a #b).
	
	subclass2Behavior := self class environment classOrTraitNamed: #Issue3399Subclass2.
	self assert: subclass2Behavior instVarNames equals: #(#a #b).
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsUpForExport [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclassBehavior |

	self deny: (self class environment includesKey: #Issue3420Subclass).
	self deny: (self class environment includesKey: #Issue3420Superclass).
	
	fileReference := (self class testDataRoot / 'Issue3420' / 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 9.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	
	self assert: (sequencer image behaviors includesKey: #Issue3420Subclass).
	self assert: (sequencer image behaviors includesKey: #Issue3420Superclass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassModification #EpClassModification).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3420Superclass #Issue3420Subclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	rootClassBehavior := self class environment classOrTraitNamed: #Issue3420Superclass.
	self assert: rootClassBehavior instVarNames equals: #(#varA varB).
	
	subclassBehavior := self class environment classOrTraitNamed: #Issue3420Subclass.
	self assert: subclassBehavior instVarNames equals: #().
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsUpInImage [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclassBehavior |

	self deny: (self class environment includesKey: #Issue3420Subclass).
	self deny: (self class environment includesKey: #Issue3420Superclass).
	
	fileReference := (self class testDataRoot / 'Issue3420' / 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 9.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	
	self assert: (sequencer image behaviors includesKey: #Issue3420Subclass).
	self assert: (sequencer image behaviors includesKey: #Issue3420Superclass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassModification #EpClassModification).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3420Superclass #Issue3420Subclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	rootClassBehavior := self class environment classOrTraitNamed: #Issue3420Superclass.
	self assert: rootClassBehavior instVarNames equals: #(#varA varB).
	
	subclassBehavior := self class environment classOrTraitNamed: #Issue3420Subclass.
	self assert: subclassBehavior instVarNames equals: #().
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassSuperclassRenameAndBothChangeForExport [
	"Check that renaming a superclass, followed by a change in the."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |

	self deny: (self class environment includesKey: #Issue3398RootClass).
	self deny: (self class environment includesKey: #Issue3398Subclass).
	self deny: (self class environment includesKey: #Issue3398RootClassRenamed).
	
	fileReference := self class testDataRoot / 'Issue3398' / 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 8.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	
	self deny: (sequencer image behaviors includesKey: #Issue3398RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3398RootClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue3398Subclass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpClassModification #EpBehaviorNameChange #EpClassModification #EpClassModification ).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3398RootClass #Issue3398Subclass #Issue3398Subclass #Issue3398RootClassRenamed #Issue3398Subclass #Issue3398RootClassRenamed).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	subclassBehavior := self class environment classOrTraitNamed: #Issue3398Subclass.
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self assert: subclassBehavior superclass name equals: 'Issue3398RootClassRenamed'.
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassSuperclassRenameAndBothChangeForInImage [
	"Check that renaming a superclass, followed by a change in the."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |

	self deny: (self class environment includesKey: #Issue3398RootClass).
	self deny: (self class environment includesKey: #Issue3398Subclass).
	self deny: (self class environment includesKey: #Issue3398RootClassRenamed).
	
	fileReference := self class testDataRoot / 'Issue3398' / 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 8.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	
	self deny: (sequencer image behaviors includesKey: #Issue3398RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3398RootClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue3398Subclass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpClassModification #EpBehaviorNameChange #EpClassModification #EpClassModification ).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3398RootClass #Issue3398Subclass #Issue3398Subclass #Issue3398RootClassRenamed #Issue3398Subclass #Issue3398RootClassRenamed).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
	subclassBehavior := self class environment classOrTraitNamed: #Issue3398Subclass.
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self assert: subclassBehavior superclass name equals: 'Issue3398RootClassRenamed'.
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothExisting_addInitial_InImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries rootclassBehavior subclassBehavior |

	self deny: (self class environment includesKey: #Issue3491RootClass).
	self deny: (self class environment includesKey: #Issue3491Subclass).
	
	fileReference := (self class testDataRoot / 'Issue3491' / 'initial' / 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	
	self assert: (sequencer image behaviors includesKey: #Issue3491RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3491SubClass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3491RootClass #Issue3491SubClass).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
			
	rootclassBehavior := self class environment classOrTraitNamed: #Issue3491RootClass.
	self assert: rootclassBehavior instVarNames equals: #(#slotA).
	
	subclassBehavior := self class environment classOrTraitNamed: #Issue3491SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB).
	self assert: subclassBehavior superclass name equals: #Issue3491RootClass.
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothExisting_removeSuperclass_InImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |

	self removeTestClasses.
	self deny: (self class environment includesKey: #Issue3491RootClass).
	self deny: (self class environment includesKey: #Issue3491SubClass).

	self superclassAndSubclassWithSuperclassRemovalBothExisting_addInitial_InImage.

	self assert: (self class environment includesKey: #Issue3491RootClass).
	self assert: (self class environment includesKey: #Issue3491SubClass).
	
	fileReference := (self class testDataRoot / 'Issue3491' / 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 7.

	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.

	"The sequenced entries currently contains one redundant entry: two class modifications to the same class in a row can be squashed, but are not"
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpMethodAddition #EpClassModification #EpClassModification #EpClassModification #EpClassRemoval).
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3491SubClass #Issue3491RootClass #Issue3491SubClass #Issue3491SubClass #Issue3491RootClass).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
			
	self deny: (self class environment hasClassNamed: #Issue3491RootClass).
	
	subclassBehavior := self class environment classOrTraitNamed: #Issue3491SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB #slotA).
	self assert: subclassBehavior superclass name equals: #Object.
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothNewInImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |

	self deny: (self class environment includesKey: #Issue3490RootClass).
	self deny: (self class environment includesKey: #Issue3490SubClass).
	
	fileReference := (self class testDataRoot / 'Issue3490' / 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu.ombu').
	self assert: fileReference exists.
	epLog :=  EpLog newWithStore: (OmStoreFactory current 
		fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3490SubClass).
	
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassRemoval).
	
	self assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ])
		equals: #(#Issue3490RootClass #Issue3490SubClass #Issue3490SubClass #Issue3490RootClass #Issue3490SubClass #Issue3490RootClass).
	
	EpMonitor disableDuring:
		[ sequencedEntries do: [ :entry |
			entry content applyCodeChange ] ].
			
	subclassBehavior := self class environment classOrTraitNamed: #Issue3490SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB #slotA).
	self assert: subclassBehavior superclass equals: Object.
	
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionForExport [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 3.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionInImage [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 3.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationForExport [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification #EpTraitModification #EpBehaviorNameChange).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationInImage [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification #EpTraitModification #EpBehaviorNameChange).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationRemovalForExport [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #TIssue2936).
	self deny: (self class environment includesKey: #TIssue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 34.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpTraitRemoval).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationRemovalInImage [
	"Check that a trait is added correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #TIssue2936).
	self deny: (self class environment includesKey: #TIssue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-3' / 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 34.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: sequencedEntries isEmpty.
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitMethodThenAdditionForExport [
	"Check that a trait method modification followed by the trait addition is exported correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: false.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Trait2961) isTrait.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpMethodAddition #EpTraitModification).
	^ sequencer.
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitMethodThenAdditionInImage [
	"Check that a trait method modification followed by the trait addition is replayed correctly.
	Strictly speaking this is producing a sequence which can't be replayed, since the trait doesn't exist when the method modification is made.  This can only happen if there are missing log files.
	However it does test that class models are converted to trait models correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2961' / 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 4.
	sequencer := GtEpEventSequencer entries: entries inImage: true.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Trait2961) isTrait.
	self assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpMethodAddition #EpTraitModification).
	^ sequencer.
]
