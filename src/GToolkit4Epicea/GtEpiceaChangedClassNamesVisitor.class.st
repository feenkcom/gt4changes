Class {
	#name : #GtEpiceaChangedClassNamesVisitor,
	#superclass : #Object,
	#traits : 'EpTEventVisitor',
	#classTraits : 'EpTEventVisitor classTrait',
	#instVars : [
		'changedClassNames',
		'shouldIncludeSubclasses'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #adding }
GtEpiceaChangedClassNamesVisitor >> addClassNamed: aClassName [
	aClassName ifNil: [ ^ self ].
	
	self changedClassNames 
		add: (self processClassName: aClassName)
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> changedClassNames [
	^ changedClassNames ifNil: [ 
		changedClassNames := Set new]
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> includeSubclasses [
	shouldIncludeSubclasses := true
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> processClassName: aClassName [
	^ aClassName withoutSuffix: ' class'
]

{ #category : #accessing }
GtEpiceaChangedClassNamesVisitor >> shouldIncludeSubclasses [
	^ shouldIncludeSubclasses ifNil: [ false ]
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitBehaviorChange: aChange [
	self addClassNamed: aChange  behaviorAffectedName 
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitBehaviorNameChange: aChange [
	self addClassNamed: aChange  oldName.
	
	self shouldIncludeSubclasses ifTrue: [
		aChange newName asClassIfPresent: [ :aNewClass |
			aNewClass subclasses do: [ :aSubclass | 
				self addClassNamed: aSubclass name ] ] ].
	
	^ self visitBehaviorChange: aChange
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitEvent: aChange [
	"Ignore all events that reach this point"
]

{ #category : #visitor }
GtEpiceaChangedClassNamesVisitor >> visitMethodChange: aChange [
	self addClassNamed: aChange  behaviorAffectedName 
]
