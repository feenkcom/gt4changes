Extension { #name : #EpMethodModification }

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> = other [

	^ (super = other) and: [ 
		self newMethod = other newMethod and: [ 
			self oldMethod = other oldMethod and: [ 
				self newProtocol = other newProtocol and: [ 
					self oldProtocol = other oldProtocol and: [ 
						self oldSourceCode = other oldSourceCode and: [ 
							self newSourceCode = other newSourceCode ] ] ] ] ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> gtIsProtocolChangeForExtensionMethod [
	self oldProtocol = self newProtocol ifTrue: [ ^ false ].
	
	^ ((self oldProtocol beginsWith: '*') or: [
		self newProtocol beginsWith: '*' ])
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> gtPreviousPackageName [
	^ (self oldProtocol beginsWith: '*')
		ifTrue: [ self oldProtocol copyWithFirst: '*' ] 
		ifFalse: [ self classPackageName ]
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> hash [
	^ super hash
		bitXor: (self newMethod hash
				bitXor: (self oldMethod hash
						bitXor: (self newProtocol hash
								bitXor: (self oldProtocol hash
										bitXor: (self oldSourceCode hash bitXor: self newSourceCode hash)))))
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> initializeWithOldMethod: anOldMethod newMethod: aNewMethod [

	self initialize.
	oldMethod := anOldMethod asEpiceaRingDefinition.
	newMethod := aNewMethod asEpiceaRingDefinition.
	
	self updateClassPackageName.
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> isEpMethodModification [

	^ true
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> selector [

	^ newMethod selector
]
