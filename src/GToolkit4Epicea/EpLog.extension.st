Extension { #name : #EpLog }

{ #category : #'*GToolkit4Epicea' }
EpLog >> endTime [

	self entries ifEmpty: [ ^ nil ].
	^ self timeAt: self entries last
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> entriesStream [
	^ store entriesStream
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> gtReset [
	store reset
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> startTime [

	^ store entriesStream next wait
		  ifSome: [ :aValue | self timeAt: aValue ]
		  ifNone: [ nil ]
]
