Class {
	#name : #GtEpiceaMonitor,
	#superclass : #EpMonitor,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#category : #'GToolkit4Epicea-Monitor'
}

{ #category : #accessing }
GtEpiceaMonitor class >> new [
	^ self newWithLog: nil
]

{ #category : #accessing }
GtEpiceaMonitor >> sendUpdate: anEvent [
	self announcer announce: GtEpiceaLogAnnouncement new
]

{ #category : #accessing }
GtEpiceaMonitor >> subscribeToJobAnnouncer [
]

{ #category : #accessing }
GtEpiceaMonitor >> subscribeToSystemAnnouncer [
	{CategoryAdded.
		CategoryRemoved.
		CategoryRenamed.
		ClassAdded.
		ClassRemoved.
		MethodAdded.
		MethodRemoved.
		ProtocolAdded.
		ProtocolRemoved.
		ClassModifiedClassDefinition.
		MethodModified.
		ClassRecategorized.
		ClassRenamed.
		ClassCommented.
		MethodRecategorized}
		do: [ :pair | 
			systemAnnouncer weak
				when: pair
				send: #sendUpdate:
				to: self ]
]
