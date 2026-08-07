"
Iterate over the supplied {{gtClass:GtEpReplayImageModel}} and answer all entries (unfiltered).
"
Class {
	#name : #GtEpImageModelAllEntriesVisitor,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpImageModelAllEntriesVisitor >> visitBehaviorReplay: aGtEpReplayBehaviorModel [

	stream nextPutAll: aGtEpReplayBehaviorModel entries.
	stream nextPutAll: aGtEpReplayBehaviorModel classSide entries.
	(aGtEpReplayBehaviorModel isRemoved and: [ aGtEpReplayBehaviorModel previousLives isNotEmpty ]) ifTrue:
		[ stream nextPutAll: aGtEpReplayBehaviorModel previousLives last entries ].
	stream nextPutAll: aGtEpReplayBehaviorModel comments.
	aGtEpReplayBehaviorModel protocolChanges do: [ :protocolChange |
		protocolChange accept: self ].
	aGtEpReplayBehaviorModel classSide protocolChanges do: [ :protocolChange |
		protocolChange accept: self ].
	aGtEpReplayBehaviorModel methods do: [ :methodModel |
		methodModel accept: self ].
	aGtEpReplayBehaviorModel classSide methods do: [ :methodModel |
		methodModel accept: self ].
]

{ #category : #visiting }
GtEpImageModelAllEntriesVisitor >> visitImageReplay: aGtEpReplayImageModel [

	stream nextPutAll: aGtEpReplayImageModel entries.
	aGtEpReplayImageModel behaviors do: [ :behaviorModel |
		behaviorModel accept: self ].
]

{ #category : #visiting }
GtEpImageModelAllEntriesVisitor >> visitMethodReplay: aGtEpReplayMethodModel [

	stream nextPutAll: aGtEpReplayMethodModel entries.

]

{ #category : #visiting }
GtEpImageModelAllEntriesVisitor >> visitNode: aGtEpReplayImageModel [

	stream := Array new writeStream.
	aGtEpReplayImageModel accept: self.
	^ stream contents
]

{ #category : #visiting }
GtEpImageModelAllEntriesVisitor >> visitProtocolReplay: aGtEpReplayProtocolModel [

	stream nextPutAll: aGtEpReplayProtocolModel entries.

]
