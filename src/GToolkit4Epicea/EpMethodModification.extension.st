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
EpMethodModification >> isEpMethodModification [

	^ true
]

{ #category : #'*GToolkit4Epicea' }
EpMethodModification >> selector [

	^ newMethod selector
]
