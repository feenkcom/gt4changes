"
Answer a boolean indicating whether the supplied EpModel will have an impact on the system assuming only the changes that would have already been applied, i.e. changes already stored in the image model.


"
Class {
	#name : #GtEpImageModelHasImpactVisitor,
	#superclass : #Object,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#instVars : [
		'image'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpImageModelHasImpactVisitor class >> image: aGtEpReplayImageModel [

	^ self basicNew 
		initializeWith: aGtEpReplayImageModel
]

{ #category : #private }
GtEpImageModelHasImpactVisitor >> behaviorNamed: aSymbol ifPresent: presentBlock [

	^ (self environment classOrTraitNamed: aSymbol) 
		ifNil: [ ]
		ifNotNil: presentBlock
]

{ #category : #accessing }
GtEpImageModelHasImpactVisitor >> environment [

	^ self class environment
]

{ #category : #initialization }
GtEpImageModelHasImpactVisitor >> initializeWith: aGtRrReplayImageModel [

	self initialize.
	image := aGtRrReplayImageModel.
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitBehaviorCategoryChange: aChange [
self halt.
	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |
			^ behavior category ~= aChange behaviorAffected category ].
			
	^ true
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitBehaviorChange: aChange [
self halt.
	self behaviorNamed: aChange behaviorAffectedName ifPresent: [ :behavior | 
		^ behavior definitionString ~= aChange behaviorAffected definitionSource or: [
			behavior classSide definitionString ~= aChange behaviorAffected classSide definitionSource ] ].

	^ true
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitBehaviorCommentChange: aChange [
self halt.
	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :aClass |
			aChange newComment = 'nil' ifTrue: 
				[ Stdio stdout << '*** ignoring ''nil'' comment'; lf.
				GtEpNilCommentSignal emit.
				^ false ].
			(aClass hasComment not and: [ aChange newComment isEmpty ]) ifTrue: [ ^ false ].
			^ aClass comment ~= aChange newComment or: [
			aClass organization commentStamp ~= aChange newStamp ] ].

	^ true
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitBehaviorNameChange: aChange [
self halt.
	self 
		behaviorNamed: aChange oldName
		ifPresent: [ :behavior | ^ true ].

	^ false
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitCategoryAddition: aChange [
self halt.
	^ (image organization includesCategory: aChange categoryName) not
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitCategoryRemoval: aChange [
	self halt.
	^ image organization includesCategory: aChange categoryName
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitCategoryRename: aChange [
self halt.
	^ image organization includesCategory: aChange oldCategoryName
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitClassRemoval: aChange [
self halt.
	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ].

	^ false
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitCodeChange: aChange [
	^ self error: 'shouldn''t happen'
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitMethodChange: aChange [
	"Addition and Modification come here"
self halt.
	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | 
			^ behavior 
				compiledMethodAt: aChange methodAffectedSelector
				ifPresent: [ :method |
					method protocol ~= aChange methodAffectedProtocol or: [
					method sourceCode ~= aChange methodAffectedSourceCode ] ]
				ifAbsent: [ true ] ].
			
	^ true "If class is not present"
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitMethodRemoval: aChange [
self halt.
	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |
			"If method comes from trait, removing has no impact."
			^ behavior 
				compiledMethodAt: aChange methodAffectedSelector
				ifPresent: [ :method | method isFromTrait not ]
				ifAbsent: [ false ] ].

	^ false "No impact if container does not exist"
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitNode: anOmEntry [

	^ anOmEntry content accept: self.
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitProtocolAddition: aProtocolAddition [
self halt.
	self 
		behaviorNamed: aProtocolAddition behaviorAffectedName
		ifPresent: [ :behavior |
			^ (behavior organization protocolOrganizer hasProtocolNamed: aProtocolAddition protocol) not ].
		
	^ true
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitProtocolRemoval: aProtocolRemoved [
	"Protocol removal has an impact if:
	- the protocl exists, and
	- there are methods in the protocol that are not trait methods"
self halt.
	self 
		behaviorNamed: aProtocolRemoved behaviorAffectedName
		ifPresent: [ :behavior |
			(behavior organization protocolOrganizer 
				getProtocolNamed: aProtocolRemoved protocol
				ifNone: [ ^ false ]) methodSelectors do: [ :each |
					(behavior compiledMethodAt: each) isFromTrait ifFalse:
						[ ^ true ] ] ].
		
	^ false
]

{ #category : #visitor }
GtEpImageModelHasImpactVisitor >> visitTraitRemoval: aChange [
self halt.
	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ].

	^ false
]
