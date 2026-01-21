Extension { #name : #OmFileStore }

{ #category : #'*GToolkit4Epicea' }
OmFileStore >> critical: aBlock [
	lock ifNil: [ lock := Mutex new ].
	^ lock critical: aBlock
]

{ #category : #'*GToolkit4Epicea' }
OmFileStore >> directory [

	^ fileReference parent
]

{ #category : #'*GToolkit4Epicea' }
OmFileStore >> entriesStream [

	| stream |
	stream := AsyncEmptyStream new.
	self fileReference ifExists: [ 
		| reader |
		reader := self newEntryReader stream: self fileReference readStream.
		stream := stream merge: (AsyncIteratorStream forIterator: reader) ].

	entryBuffer ifNotNil: [ stream := stream merge: (AsyncSequenceStream forCollection: entryBuffer )].

	^ stream
]

{ #category : #'*GToolkit4Epicea' }
OmFileStore >> isFileStore [
	"Answer a boolean indicating whether the receiver has a disk file as the store"
	
	^ true
]

{ #category : #'*GToolkit4Epicea' }
OmFileStore >> reset [
	self
		critical: [ mustRefresh := false.
			self fileReference ensureDelete ensureCreateFile.
			self initialize ]
]
