Class {
	#name : #GtEpiceaMonitor,
	#superclass : #EpMonitor,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#category : 'GToolkit4Epicea-Monitor'
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
	self 
		forPharo12AndNewer: [self subscribeToSystemAnnouncerPharo12] 
		forPharo11: [self subscribeToSystemAnnouncerPharo11]
]

{ #category : #accessing }
GtEpiceaMonitor >> subscribeToSystemAnnouncerPharo11 [
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

{ #category : #accessing }
GtEpiceaMonitor >> subscribeToSystemAnnouncerPharo12 [
	{
		PackageAdded.
		PackageRenamed.
		PackageRemoved.
		PackageTagAdded.
		PackageTagRemoved.
		PackageTagRenamed.
		ClassAdded.
		ClassRemoved.
		MethodAdded.
		MethodRemoved.
		ProtocolAdded.
		ProtocolRemoved.
		ClassModifiedClassDefinition.
		MethodModified.
		ClassRepackaged.
		ClassRenamed.
		ClassCommented.
		MethodRecategorized
	}
		do: [ :pair | 
			self systemAnnouncer weak
				when: pair
				send: #sendUpdate:
				to: self ]
]
