Class {
	#name : #GtEpiceaClassInPackageHistory,
	#superclass : #GtEpiceaClassHistory,
	#instVars : [
		'targetPackageName'
	],
	#category : #'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaClassInPackageHistory class >> methodHistoryType [
	^ GtEpiceaMethodInPackageHistory
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> isInitialBehaviourChangeAddition [
	| epEvent |
	
	epEvent := self behaviourChanges initialChange content.
	^ super isInitialBehaviourChangeAddition or: [
		(epEvent class = EpBehaviorCategoryChange and: [
			epEvent classAffected package = self targetPackageName]) ]
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> isLatestBehaviourChangeRemoval [
	| epEvent |
	
	epEvent := self behaviourChanges latestChange content.
	^ super isLatestBehaviourChangeRemoval or: [
		(epEvent class = EpBehaviorCategoryChange and: [
			epEvent oldPackageName = self targetPackageName]) ]
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> targetPackageName [

	^ targetPackageName
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> targetPackageName: aPackageName [

	targetPackageName := aPackageName.
	methodHistories do: [ :aMethodHistory |
		aMethodHistory targetPackageName: aPackageName ] 
]
