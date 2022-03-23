Extension { #name : #EpLog }

{ #category : #'*GToolkit4Epicea' }
EpLog >> endTime [
	^ self timeAt: self entries last
]

{ #category : #'*GToolkit4Epicea' }
EpLog >> startTime [
	^ self timeAt: self entries first
]
