Extension { #name : #OmSTONEntryReader }

{ #category : #'*GToolkit4Epicea' }
OmSTONEntryReader >> hasNext [
	^ stream atEnd not
]

{ #category : #'*GToolkit4Epicea' }
OmSTONEntryReader >> next [

	^ self nextEntry
]

{ #category : #'*GToolkit4Epicea' }
OmSTONEntryReader >> stonReader [

	^ reader ifNil: [
		reader := GtStonObjectModelReader enabled
			ifTrue: [ GtStonObjectModelReader forPharo11Epicea ]
			ifFalse: [ STON reader ] ]
]
