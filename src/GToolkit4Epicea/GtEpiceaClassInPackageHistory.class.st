Class {
	#name : #GtEpiceaClassInPackageHistory,
	#superclass : #GtEpiceaClassHistory,
	#instVars : [
		'targetPackageName'
	],
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> isInitialBehaviourChangeAddition [
	| epEvent |
	
	epEvent := self behaviourChanges initialChange content.
	^ super isInitialBehaviourChangeAddition or: [
		(epEvent class = EpBehaviorCategoryChange and: [
			epEvent newCategory = self targetPackageName]) ]
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> isLatestBehaviourChangeRemoval [
	| epEvent |
	
	epEvent := self behaviourChanges latestChange content.
	^ super isLatestBehaviourChangeRemoval or: [
		(epEvent class = EpBehaviorCategoryChange and: [
			epEvent oldCategory = self targetPackageName]) ]
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> targetPackageName [

	^ targetPackageName
]

{ #category : #accessing }
GtEpiceaClassInPackageHistory >> targetPackageName: aPackageName [

	targetPackageName := aPackageName
]
