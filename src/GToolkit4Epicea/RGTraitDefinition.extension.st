Extension { #name : #RGTraitDefinition }

{ #category : #'*GToolkit4Epicea' }
RGTraitDefinition >> packageName [

	^ self
		forPharo12: [ package name ]
		forPharo11AndPharo10: [ package ]
]
