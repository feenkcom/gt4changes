Extension { #name : #OmBlockFileStore }

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
