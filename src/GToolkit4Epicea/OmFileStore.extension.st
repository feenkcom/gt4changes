Extension { #name : #OmFileStore }

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
