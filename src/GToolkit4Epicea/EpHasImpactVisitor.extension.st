Extension { #name : #EpHasImpactVisitor }

{ #category : #'*GToolkit4Epicea' }
EpHasImpactVisitor >> visitBehaviorCommentChange: aChange [

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
