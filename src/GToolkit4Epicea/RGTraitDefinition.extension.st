Extension { #name : #RGTraitDefinition }

{ #category : #'*GToolkit4Epicea' }
RGTraitDefinition >> packageName [

	^ self
		forPharo12AndNewer: [ package name ]
		forPharo11: [ package ]
]
