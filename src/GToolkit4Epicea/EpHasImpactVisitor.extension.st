Extension { #name : #EpHasImpactVisitor }

{ #category : #'*GToolkit4Epicea' }
EpHasImpactVisitor >> visitBehaviorCommentChange: aChange [

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :aClass | 
			^ aClass comment ~= aChange newComment or: [
			aClass organization commentStamp ~= aChange newStamp ] ].

	^ aChange newComment isNotNil 
		and: [ aChange newComment isNotEmpty
		and: [ aChange newComment ~= 'nil' ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpHasImpactVisitor >> visitProtocolRemoval: aProtocolRemoved [
	"Protocol removal has an impact if:
	- the protocl exists, and
	- there are methods in the protocol that are not trait methods"

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
