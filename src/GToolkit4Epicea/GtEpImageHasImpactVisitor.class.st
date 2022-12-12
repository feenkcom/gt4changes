"
Answer a boolean indicating whether the supplied EpModel will have an impact on the system assuming the running image and changes that would have already been applied, i.e. changes already stored in the image model.
"
Class {
	#name : #GtEpImageHasImpactVisitor,
	#superclass : #Object,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#instVars : [
		'image'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #'instance creation' }
GtEpImageHasImpactVisitor class >> image: aGtEpReplayImageModel [

	^ self basicNew 
		initializeWith: aGtEpReplayImageModel
]

{ #category : #private }
GtEpImageHasImpactVisitor >> behaviorNamed: aSymbol ifPresent: presentBlock [

	^ (self environment classOrTraitNamed: aSymbol) 
		ifNil: [ ]
		ifNotNil: presentBlock
]

{ #category : #accessing }
GtEpImageHasImpactVisitor >> environment [

	^ self class environment
]

{ #category : #initialization }
GtEpImageHasImpactVisitor >> initializeWith: aGtRrReplayImageModel [

	self initialize.
	image := aGtRrReplayImageModel.
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitBehaviorCategoryChange: aChange [

	self error: 'Category changes aren''t recorded properly'.

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |
			^ behavior category ~= aChange behaviorAffected category ].
			
	^ true
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitBehaviorChange: aChange [

	image 
		behaviorAt: aChange behaviorAffectedName
		ifPresent:
			[ :behaviorModel | | latest |
				behaviorModel entries ifNotEmpty:
					[ latest := behaviorModel entries last content.
					[ ^ latest behaviorAffected definitionSource ~= aChange behaviorAffected definitionSource or: 
						[ latest behaviorAffected classSide definitionString ~= aChange behaviorAffected classSide definitionSource ] ] ] ]
		ifAbsent: [ ].
	self 
		behaviorNamed: aChange behaviorAffectedName 
		ifPresent: [ :behavior | 
			^ behavior definitionString ~= aChange behaviorAffected definitionSource or: [
				behavior classSide definitionString ~= aChange behaviorAffected classSide definitionSource ] ].

	^ true
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitBehaviorCommentChange: aChange [

	aChange newComment = 'nil' ifTrue: [ self error: 'nil string comment not allowed' ].
	image
		behaviorAt: aChange behaviorAffectedName
		ifPresent: [ :aClass |
			aClass hasCommentEntry ifTrue:
				[ ^ aClass latestCommentEntry content newComment ~= aChange newComment or: [
					aClass latestCommentEntry content newStamp ~= aChange newStamp ] ] ]
		ifAbsent: [].
	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :aClass |
			(aClass hasComment not and: [ aChange newComment isEmpty ]) ifTrue: [ ^ false ].
			^ aClass comment ~= aChange newComment or: [
			aClass organization commentStamp ~= aChange newStamp ] ].

	^ true
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitBehaviorNameChange: aChange [

	image
		behaviorAt: aChange oldName
		ifPresent: [ :behaviorModel | ^ true ]
		ifAbsent:
			[ self 
				behaviorNamed: aChange oldName
				ifPresent: [ :behavior | ^ true ] ].

	^ false
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitCategoryAddition: aChange [

	self error: 'Category changes aren''t recorded properly'.

	^ (image organization includesCategory: aChange categoryName) not
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitCategoryRemoval: aChange [

	self error: 'Category changes aren''t recorded properly'.

	^ image organization includesCategory: aChange categoryName
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitCategoryRename: aChange [

	self error: 'Category changes aren''t recorded properly'.

	^ image organization includesCategory: aChange oldCategoryName
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitClassRemoval: aChange [

	image
		behaviorAt: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ]
		ifAbsent: 
			[ self 
				behaviorNamed: aChange behaviorAffectedName
				ifPresent: [ :behavior | ^ true ] ].
	^ false
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitCodeChange: aChange [
	^ self error: 'shouldn''t happen'
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitMethodChange: aChange [
	"Addition and Modification come here"

	image
		behaviorAt: aChange behaviorAffectedName
		ifPresent: [ :behaviorModel |
			behaviorModel
				methodAt: aChange methodAffectedSelector
				ifPresent: [ :methodModel | | latest |
					latest := methodModel entries last content.
					^ latest methodAffectedProtocol ~= aChange methodAffectedProtocol or: [
						latest methodAffectedSourceCode ~= aChange methodAffectedSourceCode ] ]
				ifAbsent: [] ]
		ifAbsent: [].

	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | 
			^ behavior 
				compiledMethodAt: aChange methodAffectedSelector
				ifPresent: [ :method |
					method protocol ~= aChange methodAffectedProtocol or: [
					method sourceCode ~= aChange methodAffectedSourceCode ] ]
				ifAbsent: [ true ] ].
			
	^ true
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitMethodRemoval: aChange [

	image
		behaviorAt: aChange behaviorAffectedName
		ifPresent: [ :behaviorModel |
			behaviorModel
				methodAt: aChange methodAffectedSelector
				ifPresent: [ :methodModel | ^ true ]
				ifAbsent: [] ]
		ifAbsent: [].
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
GtEpImageHasImpactVisitor >> visitNode: anOmEntry [

	^ anOmEntry content accept: self.
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitProtocolAddition: aProtocolAddition [

	image
		behaviorAt: aProtocolAddition behaviorAffectedName
		ifPresent: [ :behavior |
			(behavior hasProtocolNamed: aProtocolAddition protocol) ifTrue: [ ^ false ] ]
		ifAbsent: [ ].
	self 
		behaviorNamed: aProtocolAddition behaviorAffectedName
		ifPresent: [ :behavior |
			^ (behavior organization protocolOrganizer hasProtocolNamed: aProtocolAddition protocol) not ].
		
	^ true
]

{ #category : #visitor }
GtEpImageHasImpactVisitor >> visitProtocolRemoval: aProtocolRemoved [
	"Protocol removal has an impact if:
	- the protocl exists, and
	- there are methods in the protocol that are not trait methods"

	"For the image model, if the protocol exists there must be non-trait methods, otherwise they'd be in the trait definition."
	image
		behaviorAt: aProtocolRemoved behaviorAffectedName
		ifPresent: [ :behavior |
			(behavior hasProtocolNamed: aProtocolRemoved protocol) ifTrue:[ ^ true ]  ]
		ifAbsent: [ ].
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
GtEpImageHasImpactVisitor >> visitTraitRemoval: aChange [

	image
		behaviorAt: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ]
		ifAbsent:
			[ self 
				behaviorNamed: aChange behaviorAffectedName
				ifPresent: [ :behavior | ^ true ] ].

	^ false
]
