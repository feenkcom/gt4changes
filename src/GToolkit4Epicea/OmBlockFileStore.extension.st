Extension { #name : #OmBlockFileStore }

{ #category : #'*GToolkit4Epicea' }
OmBlockFileStore >> blockForLocalNameAsInteger: anIndex [

	self checkIfMustRefresh.
	blocks reverseDo: [:each | each firstLocalNameAsInteger <= anIndex ifTrue: [ ^each ] ].
	^ self error: 'block not found'
]

{ #category : #'*GToolkit4Epicea' }
OmBlockFileStore >> gtViewBlocksFor: aView [ 
	<gtView>
	
	^aView columnedList 
		title: 'Blocks';
		items: [ blocks ];
		priority: 45;
		column: 'Local Name' text: [ :anOmbuBlock | anOmbuBlock firstLocalNameAsInteger ] width: 80;
		column: 'First Entry' text: [ :anOmbuBlock | anOmbuBlock firstEntryReference ] width: 450;
		column: 'Start Position' text: [ :anOmbuBlock | anOmbuBlock startPosition  ];
		column: 'End Position' text: [ :anOmbuBlock | anOmbuBlock endPosition ]
]

{ #category : #'*GToolkit4Epicea' }
OmBlockFileStore >> reset [
	self fileReference ensureDelete ensureCreateFile.

	self
		critical: [ mustRefresh := false.
			self initialize.
			self fileReference ifAbsent: [ ^ self ].
			self
				readEntriesWith: [ :readStream | 
					self refreshNewBlocksFrom: readStream.
					self refreshHeadReferenceAndEntryCountFrom: readStream ] ]
]
