Extension { #name : #OmSTONEntryReader }

{ #category : #'*GToolkit4Epicea' }
OmSTONEntryReader >> hasNext [
	^ stream atEnd not
]

{ #category : #'*GToolkit4Epicea' }
OmSTONEntryReader >> next [

	^ self nextEntry
]
