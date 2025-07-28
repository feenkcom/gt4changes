Extension { #name : #RGMetaclassDefinition }

{ #category : #'*GToolkit4Epicea' }
RGMetaclassDefinition >> gtDefinitionSource [
	"Answer a generated string that represents the receiver"

	^ String streamContents: [ :stream |
		stream << self name; cr.
		stream tab; << ' instanceVariableNames: '''.
		self instanceVariables
			do: [ :ivar | stream << ivar name ]
			separatedBy: [ stream space ].
		stream nextPut: $'; cr ].
]

{ #category : #'*GToolkit4Epicea' }
RGMetaclassDefinition >> packageName [

	^ baseClass packageName
]
