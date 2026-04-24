Class {
	#name : #GtEpiceaMethodInPackageHistory,
	#superclass : #GtEpiceaMethodHistory,
	#instVars : [
		'targetPackageName'
	],
	#category : #'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaMethodInPackageHistory >> isInitialChangeAddition [
	| epEvent |
	
	epEvent := self initialChange content.
	^ super isInitialChangeAddition or: [
		(epEvent class = EpMethodModification and: [
			epEvent gtIsProtocolChangeForExtensionMethod and: [
				epEvent gtAffectedPackageName = self targetPackageName ] ]) ]
]

{ #category : #accessing }
GtEpiceaMethodInPackageHistory >> isLatestChangeRemoval [
	| epEvent |
	
	epEvent := self latestChange content.
	^ super isLatestChangeRemoval or: [
		(epEvent class = EpMethodModification and: [
			epEvent gtIsProtocolChangeForExtensionMethod and: [
				epEvent gtPreviousPackageName = self targetPackageName ] ]) ]
]

{ #category : #accessing }
GtEpiceaMethodInPackageHistory >> targetPackageName [
	^ targetPackageName
]

{ #category : #accessing }
GtEpiceaMethodInPackageHistory >> targetPackageName: aPackageName [
	targetPackageName := aPackageName
]
