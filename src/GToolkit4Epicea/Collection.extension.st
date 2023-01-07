Extension { #name : #Collection }

{ #category : #'*GToolkit4Epicea' }
Collection >> detectMaxCollateWith: aSortFunction [
	"Evaluate the sort function with each of the receiver's elements as the argument. 
	Answer the element for which the sort function evaluates to the highest magnitude.
	If collection empty, return nil."
	| maxElement |

	self do: [ :each |
		maxElement == nil ifTrue: 
			[ "first element"
			maxElement := each ]
		ifFalse: 
			[ (aSortFunction collate: each with: maxElement) = 1 ifTrue:
				[ maxElement := each ] ] ].
	^ maxElement
]

{ #category : #'*GToolkit4Epicea' }
Collection >> detectMinCollateWith: aSortFunction [
	"Evaluate the sort function with each of the receiver's elements as the argument. 
	Answer the element for which the sort function evaluates to the highest magnitude.
	If collection empty, return nil."
	| minElement |

	self do: [ :each |
		minElement == nil ifTrue: 
			[ "first element"
			minElement := each ]
		ifFalse: 
			[ (aSortFunction collate: each with: minElement) = -1 ifTrue:
				[ minElement := each ] ] ].
	^ minElement
]
