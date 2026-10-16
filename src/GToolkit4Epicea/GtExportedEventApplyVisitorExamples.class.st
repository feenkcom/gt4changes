Class {
	#name : #GtExportedEventApplyVisitorExamples,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #'examples - support' }
GtExportedEventApplyVisitorExamples >> cleanUp [
	(Smalltalk classNamed: #GtExportedEventApplyVisitorExamplesClass)
		ifNotNil: [ :cls | cls removeFromSystem ].
	self packageOrganizer removePackage: 'GtExportedEventApplyVisitorExamplesPkg'
]

{ #category : #examples }
GtExportedEventApplyVisitorExamples >> packageRemovalAppliedWhenEmpty [
	"Verify that applying a package removal event works when the package is empty."
	<gtExample>
	<after: #cleanUp>
	| packageName packageRemovalEvent visitor |
	packageName := 'GtExportedEventApplyVisitorExamplesPkg'.

	self packageOrganizer removePackage: packageName.
	self packageOrganizer ensurePackage: packageName.

	self assert: (self packageOrganizer hasPackage: packageName).

	packageRemovalEvent := EpPackageRemoval packageName: packageName.

	visitor := GtExportedEventApplyVisitor new.
	packageRemovalEvent accept: visitor.

	self assert: (self packageOrganizer hasPackage: packageName) not.
	^ visitor
]

{ #category : #examples }
GtExportedEventApplyVisitorExamples >> packageRemovalSkippedWhenNonEmpty [
	"Verify that applying a package removal event is a no-op when the package still contains classes."
	<gtExample>
	<after: #cleanUp>
	| packageName packageRemovalEvent visitor |
	packageName := 'GtExportedEventApplyVisitorExamplesPkg'.

	self packageOrganizer removePackage: packageName.
	Object subclass: #GtExportedEventApplyVisitorExamplesClass
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName.

	self assert: (self packageOrganizer hasPackage: packageName).

	packageRemovalEvent := EpPackageRemoval packageName: packageName.

	visitor := GtExportedEventApplyVisitor new.
	packageRemovalEvent accept: visitor.

	self assert: (self packageOrganizer hasPackage: packageName).
	self assert: (self packageOrganizer packageNamed: packageName) definedClasses isEmpty not.
	^ visitor
]

{ #category : #examples }
GtExportedEventApplyVisitorExamples >> packageTagRemovalAppliedWhenEmpty [
	"Verify that applying a package tag removal event works when the tag has no classes."
	<gtExample>
	<after: #cleanUp>
	| packageName package tagRemovalEvent visitor tagName |
	packageName := 'GtExportedEventApplyVisitorExamplesPkg'.
	tagName := 'EmptyTag'.

	self packageOrganizer removePackage: packageName.
	self packageOrganizer ensurePackage: packageName.

	package := self packageOrganizer packageNamed: packageName.
	package ensureTag: tagName.
	self assert: (package tags anySatisfy: [ :t | t name = tagName ]).

	tagRemovalEvent := EpPackageTagRemoval
		tagName: tagName
		packageName: packageName.

	visitor := GtExportedEventApplyVisitor new.
	tagRemovalEvent accept: visitor.

	self assert: (package tags anySatisfy: [ :t | t name = tagName ]) not.
	^ visitor
]

{ #category : #examples }
GtExportedEventApplyVisitorExamples >> packageTagRemovalSkippedWhenNonEmpty [
	"Verify that applying a package tag removal event is a no-op when the tag still contains classes."
	<gtExample>
	<after: #cleanUp>
	| packageName package tagRemovalEvent visitor |
	packageName := 'GtExportedEventApplyVisitorExamplesPkg'.

	self packageOrganizer removePackage: packageName.
	Object subclass: #GtExportedEventApplyVisitorExamplesClass
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName.

	package := self packageOrganizer packageNamed: packageName.
	self assert: package definedClasses isEmpty not.

	tagRemovalEvent := EpPackageTagRemoval
		tagName: package rootTagName
		packageName: packageName.

	visitor := GtExportedEventApplyVisitor new.
	tagRemovalEvent accept: visitor.

	self assert: (self packageOrganizer hasPackage: packageName).
	self assert: (package tags anySatisfy: [ :t | t name = package rootTagName ]).
	self assert: package definedClasses isEmpty not.
	^ visitor
]
