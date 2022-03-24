Extension { #name : #EpLog }

{ #category : #'*GToolkit4Epicea' }
EpLog >> endTime [

	self entries ifEmpty: [ ^ nil ].
	^ self timeAt: self entries last
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> startTime [

	self entries ifEmpty: [ ^ nil ].
	^ self timeAt: self entries first
]
