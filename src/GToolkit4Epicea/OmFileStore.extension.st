Extension { #name : #OmFileStore }

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
