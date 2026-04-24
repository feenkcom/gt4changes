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
		#(#Issue2924 #Issue2936 #Issue2936v2 #Issue2936v4 #Issue2936v41 #Issue2936v5
		#Issue2961 #Issue3398 #Issue3399 #Issue3420 #Issue3490 #Issue3491
		#GtEpEventSequencerExampleChecks) do: [ :each |
				self 
					forPharo12AndNewer: [ self packageOrganizer removePackage: each ]
					forPharo11: [ self environment organization 
						removeCategory: each ] ] ].
]

{ #category : #'private - helpers' }
GtEpEventSequencerExamples class >> testDataRoot [

	^ GtEpiceaExampleOmbuFiles new dataDir / self name
]

{ #category : #examples }
GtEpEventSequencerExamples >> addRemoveAddClassForExport [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	fileReference := self class testDataRoot / 'addRemoveAddClass.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 18.

	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil nil nil nil nil nil nil nil nil nil #required nil #required nil nil nil nil #required).
	^ sequencer
]

{ #category : #asserting }
GtEpEventSequencerExamples >> assert: actual equals: expected [
	^ self
		assert: (actual sameContentAs: expected)
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #examples }
GtEpEventSequencerExamples >> behaviorRenameWithoutDependentsForExport [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer |
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required).
	self deny: (sequencer image behaviors at: #Issue2961ClassRenamed) isDefined.
	self deny: (sequencer image behaviors at: #Issue2961TraitRenamed) isDefined.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> behaviorRenameWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #superseeded nil #superseeded).
	self assert: (sequencer image behaviors includesKey: #Issue2961ClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue2961TraitRenamed).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> changeSuperclassForExport [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |

	self removeTestClasses.
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3530' / 'Issue3530-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Get the system to the initial state"
	EpMonitor
		disableDuring: [ (entries first: 3) do: [ :each | each content applyCodeChange ] ].

	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required #superseeded #required).
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2)
				superclassName
		equals: #Object.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> changeSuperclassInImage [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self removeTestClasses.
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3530' / 'Issue3530-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Get the system to the initial state"
	EpMonitor
		disableDuring: [ (entries first: 3) do: [ :each | each content applyCodeChange ] ].

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required #superseeded #required).
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2)
				superclassName
		equals: #Object.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2924).
	fileReference := self class testDataRoot / 'Issue2924'
			/ 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required #required #required).
	self deny: (sequencer image behaviors includesKey: #Issue2924).
	self assert: (sequencer image behaviors includesKey: #Issue2924Renamed).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameInImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2924).
	fileReference := self class testDataRoot / 'Issue2924'
			/ 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required #required #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
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
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	
	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required #superseeded #required #required #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpMethodModification #EpClassModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed1InImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	
	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required #superseeded #required #required #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpMethodModification #EpClassModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed2ForExport [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	
	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3.ombu'.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 16.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil nil #superseeded nil #superseeded nil #required nil nil nil nil #required nil #required nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleCompressed2InImage [
	"Check that a class add and rename is sequenced correctly."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	#(#Issue2936 #Issue2936v5 #Issue2936v51 #Issue2936v51 #Issue2936v52)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-5'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3.ombu'.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 16.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil nil #superseeded nil #superseeded nil #required nil nil nil nil #required nil #required nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpBehaviorNameChange).
	self deny: (sequencer image behaviors includesKey: #Issue2936v5).
	self assert: (sequencer image behaviors includesKey: #Issue2936v52).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v52.
	self deny: (self class environment includesKey: #Issue2936v5).
	self assert: behavior package name equals: 'Issue2936v5'.
	self assert: behavior instVarNames equals: #(#iv1 #iv2).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleForExport [
	"Check that a class add and rename is sequenced correctly.
	This is suboptimal in that the final 2 name changes could be excluded,
	but they will be fine assuming ????"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior sequencedClassNames |
	#(#Issue2936 #Issue2936v4 #Issue2936v41 #Issue2936v42 #Issue2936v43)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-4'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required #required #required nil #required nil nil #required #required #required).
	sequencedClassNames := sequencedEntries collect: [ :each | each content class name ] as: Array.
	self
		assert: sequencedClassNames = #(#EpClassAddition #EpBehaviorNameChange #EpClassModification #EpBehaviorRepackagedChange #EpClassRemoval #EpBehaviorNameChange #EpBehaviorNameChange)
		description: [ 'Unexpected class names: ', sequencedClassNames printString ].
	self deny: (sequencer image behaviors includesKey: #Issue2936v4).
	self deny: (sequencer image behaviors includesKey: #Issue2936v41).
	self deny: (sequencer image behaviors includesKey: #Issue2936v42).
	self assert: (sequencer image behaviors includesKey: #Issue2936v43).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v43.
	self assert: behavior package name equals: 'Issue2936v41'.
	self assert: behavior instVarNames equals: #(#iv1).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddAndRenameMultipleInImage [
	"Check that a class add and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior sequencedClassNames |

	#(#Issue2936 #Issue2936v4 #Issue2936v41 #Issue2936v42 #Issue2936v43)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-4'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required #required #required nil #required nil nil #superseeded #required #required).
	sequencedClassNames := sequencedEntries collect: [ :each |
		each content class name ].
	self
		assert: sequencedClassNames asArray = #(#EpClassAddition #EpBehaviorNameChange #EpClassModification #EpBehaviorRepackagedChange #EpBehaviorNameChange #EpBehaviorNameChange)
		description: [ 'Unexpected class names: ', sequencedClassNames printString ].
	self deny: (sequencer image behaviors includesKey: #Issue2936v4).
	self deny: (sequencer image behaviors includesKey: #Issue2936v41).
	self deny: (sequencer image behaviors includesKey: #Issue2936v42).
	self assert: (sequencer image behaviors includesKey: #Issue2936v43).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	behavior := self class environment classOrTraitNamed: #Issue2936v43.
	self assert: behavior package name equals: 'Issue2936v41'.
	self assert: behavior instVarNames equals: #(#iv1).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameForExport [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #superseeded #required nil #required #required #superseeded #required #required nil nil #required nil #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ]
			as: Array.
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
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #superseeded #required nil #required #required #superseeded #required #required nil nil #required nil #superseeded).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ]
			as: Array.
	self
		assert: sequencedClassNames
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemove2ForExport [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExamplesExampleClass).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExamplesExampleClassRenamed).
	fileReference := self class testDataRoot / 'Issue3487'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 16.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil nil nil nil nil nil nil nil nil nil #required nil nil nil nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemove2InImage [
	"Check that a class add, modify, rename and remove is sequenced correctly."

	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExamplesExampleClass).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExamplesExampleClassRenamed).
	fileReference := self class testDataRoot / 'Issue3487'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 16.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil nil nil nil nil nil #superseeded #superseeded #superseeded #superseeded #superseeded nil #superseeded nil #superseeded #superseeded).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemoveForExport [
	"Check that a class add, modify, rename and remove is sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 22.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil nil nil nil nil #required nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddModifyRenameRemoveInImage [
	"Check that a class add, modify, rename and remove is sequenced correctly."

	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 22.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil nil nil #superseeded #superseeded #superseeded nil nil nil nil nil nil nil #superseeded nil nil nil #superseeded #superseeded #superseeded #superseeded #superseeded).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAddWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass is missing."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer |
	
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self
		should: [ sequencer assertDependencies ]
		raise: GtEpMissingClassError.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil nil #requiredMissingDependency).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithSuperclassMethodModificationForExport [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithSuperclassMethodModificationInImage [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAdditionWithoutSuperclassInImage [
	"Check that adding a class when one of the superclasses is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer |
	
	self deny: (self class environment includesKey: #SuperClassGone).
	fileReference := self class testDataRoot / 'Issue2961-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self
		should: [ sequencer assertDependencies ]
		raise: GtEpMissingClassError.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAndTraitRemovalWithoutDependentsForExport [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 30.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassRemoval #EpTraitRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classAndTraitRemovalWithoutDependentsInImage [
	"Check that removing methods when the required class / trait is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Renamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 30.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #superseeded nil #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded #superseeded).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classHierarchyAdditionForExport [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck2).
	fileReference := self class testDataRoot / 'Issue3171'
			/ 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required #required #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpClassAddition #EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classHierarchyAdditionInImage [
	"Check that adding a class when the superclass only has methods modified is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck2).
	fileReference := self class testDataRoot / 'Issue3171'
			/ 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #required #required #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ]) asArray
		equals: #(#EpClassAddition #EpClassAddition #EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classModifyRenameForExport [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.
	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries third content applyCodeChange.
			entries fifth content applyCodeChange ].
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification) asArray equals:
		#(nil #superseeded #required nil #required #required #superseeded #required #required nil nil #required nil #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ]
			as: Array.
	"Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods
			reject: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#method1 #method2 #renamed) asSet.
	"Removed Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods
			select: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#anotherMethodToBeRenamed) asSet.
	self
		assert: sequencedClassNames
		equals: #(#EpClassModification #EpMethodModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition #EpMethodRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classModifyRenameInImage [
	"Check that a class add, modify and rename is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames classModification methodModification |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 14.	
	"Add the class and method1 to the system"
	classModification := entries detect: [ :each | each content class = EpClassModification ].
	methodModification := entries detect: [ :each | each content class = EpMethodModification ].
	EpMonitor disableDuring: 
		[ classModification content applyCodeChange.
		methodModification content applyCodeChange ].
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #superseeded #required nil #superseeded #required #superseeded #required #required nil nil #required nil #superseeded).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936Renamed).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ] as: Array.	"Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods
			reject: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#method1 #method2 #renamed) asSet.	"Removed Methods"
	methodNames := ((sequencer image behaviorAt: #Issue2936Renamed) methods
			select: #isRemoved) collect: #selector.
	self assert: methodNames asSet equals: #(#anotherMethodToBeRenamed) asSet.
	self
		assert: sequencedClassNames
		equals: #(#EpClassModification #EpBehaviorNameChange #EpClassModification #EpMethodAddition #EpMethodAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classProtocolRemovalForExport [
	"Check that class side protocol removal is sequenced correctly.
	#classMethod1 is removed manually, and the protocol automatically.
	#cp2 is removed manually, automatically removing #classMethod2."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2958'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil nil nil nil #required nil nil #required nil).
	self assert: (sequencer image behaviors includesKey: #Issue2958).
	behavior := sequencer image classOrTraitNamed: #Issue2958.
	self assert: behavior methods keys isEmpty.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpMethodRemoval #EpMethodRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classProtocolRemovalInImage [
	"Check that class side protocol removal is sequenced correctly.
	#classMethod1 is removed manually, and the protocol automatically.
	#cp2 is removed manually, automatically removing #classMethod2."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries behavior |
	
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2958'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 11.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil nil nil nil #superseeded nil nil #superseeded nil).
	self assert: (sequencer image behaviors includesKey: #Issue2958).
	behavior := sequencer image classOrTraitNamed: #Issue2958.
	self assert: behavior methods keys isEmpty.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRefactoringExistingInImage [
	"Check that a class refactirubg is sequenced correctly.
	As there are no methods defined, and the system initial state matches the final class modification, the entire sequence is not required.
	However filtering isn't that sophisticated yet, so the entire sequence stays."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-6'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 7.
	"Add the class to the system"
	EpMonitor disableDuring: [ entries last content applyCodeChange ].
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required #required #required #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	"self assert: sequencedEntries isEmpty."
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRefactoringInImage [
	"Check that a class refactering is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936Renamed).
	fileReference := self class testDataRoot / 'Issue2936-6'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 7.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required #required #required #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ]
			as: Array.
	"The current implementation is sub-optimal as there are no method definitions, so only the final EpClassModification is really required."
	self assert: sequencedClassNames equals: #(#EpClassAddition #EpBehaviorRepackagedChange #EpClassModification #EpBehaviorNameChange #EpClassModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameAndRemovalForExport [
	"Check that a class rename and removal is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries reason |

	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	fileReference := self class testDataRoot / 'Issue4080' / 'RenameExport.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required).
	reason := sequencer wrappedEntries second reason.
	self assert: reason class equals: GtEpPreviousLifeBehaviorNameChangeEntryRequiredReason.
	self assert: reason kind equals: #previousLifeBehaviorNameChangeEntryRequired.
	self assert: sequencedEntries size equals: 2.
	self assert: sequencedEntries last content isEpClassRemoval.
	self
		assert: sequencedEntries last content behaviorAffectedName
		equals: #GtEpEventSequencerExampleClass2.
	sequencedEntries
		do: [ :entry |
			self
				shouldnt: [ entry content accept: GtExportedEventApplyVisitor new ]
				raise: Error ].

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameAndRemovalInImage [
	"Check that a class rename and removal is sequenced correctly."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries reason |
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	fileReference := self class testDataRoot / 'Issue4080' / 'RenameExport.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #superseeded #superseeded #superseeded).
	reason := sequencer wrappedEntries second reason.
	self assert: reason class equals: GtEpBehaviorRemovedReason.
	self assert: reason kind equals: #behaviorRemoved.
	self assert: reason removalEntry identicalTo: sequencer wrappedEntries last.
	self assert: sequencedEntries size equals: 0.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingCommentForExport [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-9'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries third content applyCodeChange ].
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ]
			as: Array.
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
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames |

	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-9'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries third content applyCodeChange ].
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ] as: Array.
	self assert: sequencedClassNames equals: #(#EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingMethodForExport [
	"Check that a class rename with an existing method is sequenced correctly."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-8'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries fourth content applyCodeChange ].
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #required #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ] as: Array.
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
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries sequencedClassNames methodNames |
	
	self deny: (self class environment includesKey: #Issue2936).
	self deny: (self class environment includesKey: #Issue2936v1).
	fileReference := self class testDataRoot / 'Issue2936-8'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries fourth content applyCodeChange ].
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil #superseeded #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self assert: (sequencer image behaviors includesKey: #Issue2936v1).
	sequencedClassNames := sequencedEntries
			collect: [ :each | each content class name ] as: Array.
	methodNames := (sequencer image behaviorAt: #Issue2936v1) methods keys.
	self assert: methodNames asSet equals: #(#method1) asSet.
	self assert: sequencedClassNames equals: #(#EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingSubclassForExport [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.	"Get the system to the initial state"
	EpMonitor
		disableDuring: [ entries do: [ :each | each content applyCodeChange ] ].

	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-2.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(#required #required).
	self assert: sequencedEntries size equals: 2.
	self
		assert: (sequencer image behaviors includesKey: #GtEpEventSequencerExampleClass1rename).
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2)
				superclassName
		equals: #GtEpEventSequencerExampleClass1rename.
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass3)
				superclassName
		equals: #GtEpEventSequencerExampleClass1rename.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classRenameWithExistingSubclassInImage [
	"Check that a class rename with an existing method is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass1).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass2).
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleClass3).
	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-1.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	"Get the system to the initial state"
	EpMonitor
		disableDuring: [ entries do: [ :each | each content applyCodeChange ] ].

	fileReference := self class testDataRoot / 'Issue3529' / 'Issue3529-2.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(#required #required).
	self assert: sequencedEntries size equals: 2.
	self
		assert: (sequencer image behaviors includesKey: #GtEpEventSequencerExampleClass1rename).
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass2)
				superclassName
		equals: #GtEpEventSequencerExampleClass1rename.
	self
		assert: (sequencer image classModelNamed: #GtEpEventSequencerExampleClass3)
				superclassName
		equals: #GtEpEventSequencerExampleClass1rename.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> classWithObsoleteSuperclassInImage [
	"Check exporting a class with an obsolete superclass raises an error.
	This example currently fails as the dependents assertion simply checks whether a superclass currently or at any time in the past existed, rather than checking a required period of time, so incorrectly flags this as OK."
	<gtExample>
	<after: #removeTestClasses>
	| fileReference entries sequencer epLog |

	fileReference := self class testDataRoot / 'Issue4908' / 'Issue4908.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self
		should: [ sequencer assertDependencies ]
		raise: GtEpMissingClassError.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsForExport [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 15.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(nil #required nil nil nil nil nil #required nil #required nil nil nil nil #required).
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpBehaviorCommentChange #EpMethodRemoval #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsInImage [
	"Check that a comments, categories and protocols sequenced correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 15.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image behaviors includesKey: #Issue2936v2).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpBehaviorCommentChange #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsRemovalForExport [
	"Check that a comments, categories and protocols sequenced correctly."

	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 19.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image classOrTraitNamed: #Issue2936v2) isRemoved.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> commentsCategoriesAndProtocolsRemovalInImage [
	"Check that a comments, categories and protocols sequenced correctly."

	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self deny: (self class environment includesKey: #Issue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-2'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 19.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #Issue2936).
	self deny: (sequencer image behaviors includesKey: #Issue2936Renamed).
	self assert: (sequencer image classOrTraitNamed: #Issue2936v2) isRemoved.
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> existingRemoveAddClass [
	"Check that changing the superclass is sequenced correctly."
	<gtExample>
	| fileReference epLog entries sequencer sequencedEntries |

	fileReference := self class testDataRoot / 'addRemoveAddClass.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	"self assert: entries size equals: 4."

	EpMonitor disableDuring: 
		[ (entries first: 8) do: [ :entry | entry content applyCodeChange ] ].

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodAddWithoutDependentsInImage [
	"Check that adding a class and method when the required superclass / class is missing is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer |
	
	self deny: (self class environment includesKey: #Issue2961Class).
	self deny: (self class environment includesKey: #Issue2961Trait).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self
		should: [ sequencer assertDependencies ]
		raise: GtEpMissingClassError.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> methodRemovalWithoutDependentsInImage [
	"Check that removing methods that miss dependencies but have no impact produces an empty sequence."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961ClassRenamed).
	self deny: (self class environment includesKey: #Issue2961TraitRenamed).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> modifyMethodChangeProtocolForExport [
	"Check that moving a method to another protocol is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	fileReference := self class testDataRoot / 'Issue2991'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries fourth content applyCodeChange ].
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries size equals: 2.
	self assert: sequencedEntries first identicalTo: entries second.
	self assert: sequencedEntries second identicalTo: entries last.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> modifyMethodChangeProtocolInImage [
	"Check that moving a method to another protocol is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheck).
	fileReference := self class testDataRoot / 'Issue2991'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 6.
	"Add the class and method1 to the system"
	EpMonitor
		disableDuring: [ entries second content applyCodeChange.
			entries fourth content applyCodeChange ].
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencedEntries size between: 1 and: 2).
	self assert: sequencedEntries last identicalTo: entries last.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> modifyMethodUnchangedInImage [
	"Check that a redundant method definition is sequenced correctly"
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| entries sequencer sequencedEntries |

	entries := { GtEpReplayImageModel new omEntryFor:
		(EpMethodAddition method: thisContext method) }.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeExistingClassForExport [
	"Check that removing a class that is already in the image is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961).
	fileReference := self class testDataRoot / 'Issue2961-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.
	EpMonitor
		disableDuring: [ entries do: [ :entry | entry content applyCodeChange ] ].
	self assert: (self class environment includesKey: #Issue2961).

	fileReference := self class testDataRoot / 'Issue2961-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeExistingClassInImage [
	"Check that removing a class that is already in the image is sequenced correctly."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2961).
	fileReference := self class testDataRoot / 'Issue2961-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.
	EpMonitor
		disableDuring: [ entries do: [ :entry | entry content applyCodeChange ] ].
	self assert: (self class environment includesKey: #Issue2961).

	fileReference := self class testDataRoot / 'Issue2961-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeExistingMethodInImage [
	"Check that removing a method that is in the image is sequenced correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self assert: (Bag methodDict includesKey: #postCopy).
	fileReference := self class testDataRoot / 'remove_Bag_postCopy.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 2.

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(#superseeded #required).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpMethodRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeMethodAndClassForExport [
	"Check that a method and class remove is sequenced correctly."

	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	#(#Issue2936)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-7'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Issue2936) isRemoved.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpClassRemoval).

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeMethodAndClassInImage [
	"Check that a method and class remove is sequenced correctly."

	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	#(#Issue2936)
		do: [ :each | self deny: (self class environment includesKey: each) ].
	fileReference := self class testDataRoot / 'Issue2936-7'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 5.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Issue2936) isRemoved.
	self assert: sequencedEntries isEmpty.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeSuperclassWithEarlierSubclassForExport [
	"Check the following sequence:
	- Add ClassA.
	- Add ClassB.
	- Add ClassC as a subclass of ClassA.
	- Modify ClassC as a subclass of ClassB.
	- Remove ClassA."
	<gtExample>
	<after: #removeTestClasses>
	<return: #Array>
	| fileReference entries sequencer epLog |

	fileReference := self class testDataRoot / 'Issue4909' / 'Issue4909.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(#required #required #superseeded #required #required).

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> removeSuperclassWithEarlierSubclassInImage [
	"Check the following sequence:
	- Add ClassA.
	- Add ClassB.
	- Add ClassC as a subclass of ClassA.
	- Modify ClassC as a subclass of ClassB.
	- Remove ClassA."
	<gtExample>
	<after: #removeTestClasses>
	<return: #Array>
	| fileReference entries sequencer epLog |

	fileReference := self class testDataRoot / 'Issue4909' / 'Issue4909.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 5.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self assert: (sequencer wrappedEntries collect: #classification as: Array) equals:
		#(#required #required #superseeded #required #required).

	^ sequencer
]

{ #category : #private }
GtEpEventSequencerExamples >> removeTestClasses [

	self class removeTestClasses.
]

{ #category : #private }
GtEpEventSequencerExamples >> sequenceReplayEntries: entries [
	| sequencer |

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencer sequencedEntries.
	self
		shouldnt: [ sequencer assertDependencies ]
		raise: GtEpMissingClassError.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAddAndRenameForExport [
	"Check that a superclass add and rename is sequenced correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheckSub).
	fileReference := self class testDataRoot / 'Issue3259'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAddAndRenameInImage [
	"Check that a superclass add and rename is sequenced correctly."

	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	self
		deny: (self class environment includesKey: #GtEpEventSequencerExampleCheckSub).
	fileReference := self class testDataRoot / 'Issue3259'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3.ombu'.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsDownForExport [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclass1Behavior subclass2Behavior |
	
	self deny: (self class environment includesKey: #Issue3399RootClass).
	self deny: (self class environment includesKey: #Issue3399Subclass1).
	self deny: (self class environment includesKey: #Issue3399Subclass2).

	fileReference := self class testDataRoot / 'Issue3399'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3399RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass1).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass2).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassModification #EpMethodAddition #EpMethodModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3399RootClass #Issue3399Subclass1 #Issue3399RootClass #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2 #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	rootClassBehavior := self class environment
			classOrTraitNamed: #Issue3399RootClass.
	self assert: rootClassBehavior instVarNames equals: #(#c).

	subclass1Behavior := self class environment
			classOrTraitNamed: #Issue3399Subclass1.
	self assert: subclass1Behavior instVarNames equals: #(#a #b).

	subclass2Behavior := self class environment
			classOrTraitNamed: #Issue3399Subclass2.
	self assert: subclass2Behavior instVarNames equals: #(#a #b).

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsDownInImage [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclass1Behavior subclass2Behavior |
	
	self deny: (self class environment includesKey: #Issue3399RootClass).
	self deny: (self class environment includesKey: #Issue3399Subclass1).
	self deny: (self class environment includesKey: #Issue3399Subclass2).

	fileReference := self class testDataRoot / 'Issue3399'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 10.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3399RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass1).
	self assert: (sequencer image behaviors includesKey: #Issue3399Subclass2).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassModification #EpMethodAddition #EpMethodModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3399RootClass #Issue3399Subclass1 #Issue3399RootClass #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2 #Issue3399RootClass #Issue3399Subclass1 #Issue3399Subclass2).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	rootClassBehavior := self class environment
			classOrTraitNamed: #Issue3399RootClass.
	self assert: rootClassBehavior instVarNames equals: #(#c).

	subclass1Behavior := self class environment
			classOrTraitNamed: #Issue3399Subclass1.
	self assert: subclass1Behavior instVarNames equals: #(#a #b).

	subclass2Behavior := self class environment
			classOrTraitNamed: #Issue3399Subclass2.
	self assert: subclass2Behavior instVarNames equals: #(#a #b).

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsUpForExport [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclassBehavior |
	
	self deny: (self class environment includesKey: #Issue3420Subclass).
	self deny: (self class environment includesKey: #Issue3420Superclass).

	fileReference := self class testDataRoot / 'Issue3420'
			/ 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 9.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3420Subclass).
	self assert: (sequencer image behaviors includesKey: #Issue3420Superclass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3420Superclass #Issue3420Subclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	rootClassBehavior := self class environment
			classOrTraitNamed: #Issue3420Superclass.
	self assert: rootClassBehavior instVarNames equals: #(#varA varB).

	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3420Subclass.
	self assert: subclassBehavior instVarNames equals: #().

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassPushTwoSlotsUpInImage [
	"Check that pushing down two instance variables works as expected"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries rootClassBehavior subclassBehavior |
	
	self deny: (self class environment includesKey: #Issue3420Subclass).
	self deny: (self class environment includesKey: #Issue3420Superclass).

	fileReference := self class testDataRoot / 'Issue3420'
			/ 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 9.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3420Subclass).
	self assert: (sequencer image behaviors includesKey: #Issue3420Superclass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3420Superclass #Issue3420Subclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass #Issue3420Subclass #Issue3420Superclass).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	rootClassBehavior := self class environment
			classOrTraitNamed: #Issue3420Superclass.
	self assert: rootClassBehavior instVarNames equals: #(#varA varB).

	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3420Subclass.
	self assert: subclassBehavior instVarNames equals: #().

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassSuperclassRenameAndBothChangeForExport [
	"Check that renaming a superclass, followed by a change in the."
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |
	
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self deny: (self class environment includesKey: #Issue3398Subclass).
	self deny: (self class environment includesKey: #Issue3398RootClassRenamed).

	fileReference := self class testDataRoot / 'Issue3398'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 8.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self deny: (sequencer image behaviors includesKey: #Issue3398RootClass).
	self
		assert: (sequencer image behaviors includesKey: #Issue3398RootClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue3398Subclass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassModification #EpBehaviorNameChange #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3398RootClass #Issue3398Subclass #Issue3398RootClassRenamed #Issue3398Subclass #Issue3398RootClassRenamed).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3398Subclass.
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self
		assert: subclassBehavior superclass name
		equals: 'Issue3398RootClassRenamed'.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassSuperclassRenameAndBothChangeForInImage [
	"Check that renaming a superclass, followed by a change in the."

	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self deny: (self class environment includesKey: #Issue3398Subclass).
	self deny: (self class environment includesKey: #Issue3398RootClassRenamed).

	fileReference := self class testDataRoot / 'Issue3398'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 8.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self deny: (sequencer image behaviors includesKey: #Issue3398RootClass).
	self
		assert: (sequencer image behaviors includesKey: #Issue3398RootClassRenamed).
	self assert: (sequencer image behaviors includesKey: #Issue3398Subclass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassModification #EpBehaviorNameChange #EpClassModification #EpClassModification).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3398RootClass #Issue3398Subclass #Issue3398RootClassRenamed #Issue3398Subclass #Issue3398RootClassRenamed).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].
	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3398Subclass.
	self deny: (self class environment includesKey: #Issue3398RootClass).
	self
		assert: subclassBehavior superclass name
		equals: 'Issue3398RootClassRenamed'.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassAdditionAndRemovalForExport [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	<return: #Array>
	| fileReference entries sequencer sequencedEntries epLog |

	fileReference := self class testDataRoot / 'Issue4477' / 'Issue4477.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassRemoval).

	^ sequencedEntries
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassAdditionAndRemovalInImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	<return: #Array>
	| fileReference entries sequencer sequencedEntries epLog |

	fileReference := self class testDataRoot / 'Issue4477' / 'Issue4477.ombu'.
	self assert: fileReference exists.
	epLog := EpLog fromFile: fileReference.
	entries := epLog entries.
	self assert: entries size equals: 3.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition).

	^ sequencedEntries
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothExisting_addInitial_InImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries rootclassBehavior subclassBehavior |
	
	self deny: (self class environment includesKey: #Issue3491RootClass).
	self deny: (self class environment includesKey: #Issue3491Subclass).

	fileReference := self class testDataRoot / 'Issue3491' / 'initial'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3491RootClass).
	self assert: (sequencer image behaviors includesKey: #Issue3491SubClass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3491RootClass #Issue3491SubClass).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].

	rootclassBehavior := self class environment
			classOrTraitNamed: #Issue3491RootClass.
	self assert: rootclassBehavior instVarNames equals: #(#slotA).

	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3491SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB).
	self assert: subclassBehavior superclass name equals: #Issue3491RootClass.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothExisting_removeSuperclass_InImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |
	
	self removeTestClasses.
	self deny: (self class environment includesKey: #Issue3491RootClass).
	self deny: (self class environment includesKey: #Issue3491SubClass).

	self superclassAndSubclassWithSuperclassRemovalBothExisting_addInitial_InImage.

	self assert: (self class environment includesKey: #Issue3491RootClass).
	self assert: (self class environment includesKey: #Issue3491SubClass).

	fileReference := self class testDataRoot / 'Issue3491'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 7.

	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpMethodAddition #EpClassModification #EpClassModification #EpClassRemoval).
	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3491SubClass #Issue3491RootClass #Issue3491SubClass #Issue3491RootClass).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].

	self deny: (self class environment hasClassNamed: #Issue3491RootClass).

	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3491SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB #slotA).
	self assert: subclassBehavior superclass name equals: #Object.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> superclassAndSubclassWithSuperclassRemovalBothNewInImage [
	"Check adding a superclass and a subclass and removing the subclass works"
	<gtExample>
	<after: #removeTestClasses>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries subclassBehavior |
	
	self deny: (self class environment includesKey: #Issue3490RootClass).
	self deny: (self class environment includesKey: #Issue3490SubClass).

	fileReference := self class testDataRoot / 'Issue3490'
			/ 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu.ombu'.
	self assert: fileReference exists.
	epLog := EpLog newWithStore: (OmStoreFactory current fromFile: fileReference).
	entries := epLog entries.
	self assert: entries size equals: 8.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.

	self assert: (sequencer image behaviors includesKey: #Issue3490SubClass).

	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpClassAddition #EpClassAddition #EpMethodAddition #EpClassModification #EpClassModification #EpClassRemoval).

	self
		assert: (sequencedEntries collect: [ :each | each content behaviorAffectedName ] as: Array)
		equals: #(#Issue3490RootClass #Issue3490SubClass #Issue3490SubClass #Issue3490RootClass #Issue3490SubClass #Issue3490RootClass).

	EpMonitor
		disableDuring: [ sequencedEntries do: [ :entry | entry content applyCodeChange ] ].

	subclassBehavior := self class environment
			classOrTraitNamed: #Issue3490SubClass.
	self assert: subclassBehavior instVarNames equals: #(#slotB #slotA).
	self assert: subclassBehavior superclass equals: Object.

	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionForExport [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 3.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpTraitAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionInImage [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 3.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpTraitAddition #EpMethodModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationForExport [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 5.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification #EpTraitModification #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationInImage [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Issue2936v3).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 5.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpTraitAddition #EpMethodModification #EpTraitModification #EpBehaviorNameChange).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationRemovalForExport [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #TIssue2936).
	self deny: (self class environment includesKey: #TIssue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 34.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: (sequencer image behaviors includesKey: #TIssue2936v2).
	self
		assert: (sequencedEntries collect: [ :each | each content class name ])
		equals: #(#EpBehaviorNameChange #EpTraitRemoval).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitAdditionModificationRemovalInImage [
	"Check that a trait is added correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #TIssue2936).
	self deny: (self class environment includesKey: #TIssue2936v2).
	fileReference := self class testDataRoot / 'Issue2936-3'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 34.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self deny: (sequencer image behaviors includesKey: #TIssue2936).
	self assert: sequencedEntries isEmpty.
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitMethodThenAdditionForExport [
	"Check that a trait method modification followed by the trait addition is exported correctly."
	<gtExample>
	<return: #GtEpForExportEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Trait2961).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 4.
	sequencer := GtEpForExportEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Trait2961) isTrait.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpMethodAddition #EpMethodAddition #EpTraitModification).
	^ sequencer
]

{ #category : #examples }
GtEpEventSequencerExamples >> traitMethodThenAdditionInImage [
	"Check that a trait method modification followed by the trait addition is replayed correctly.
	Strictly speaking this is producing a sequence which can't be replayed, since the trait doesn't exist when the method modification is made.  This can only happen if there are missing log files.
	However it does test that class models are converted to trait models correctly."
	<gtExample>
	<return: #GtEpInImageEventSequencer>
	| fileReference epLog entries sequencer sequencedEntries |
	
	self deny: (self class environment includesKey: #Trait2961).
	fileReference := self class testDataRoot / 'Issue2961'
			/ 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1.ombu'.
	self assert: fileReference exists.
	epLog := GtEpLogEnumerator fromFile: fileReference.
	entries := epLog priorEntriesFromHead reversed.
	self assert: entries size equals: 4.
	sequencer := GtEpInImageEventSequencer entries: entries.
	sequencedEntries := sequencer sequencedEntries.
	self assert: (sequencer image classOrTraitNamed: #Trait2961) isTrait.
	self
		assert: (sequencedEntries collect: [ :each | each content class name ] as: Array)
		equals: #(#EpMethodAddition #EpMethodAddition #EpTraitModification).
	^ sequencer
]
