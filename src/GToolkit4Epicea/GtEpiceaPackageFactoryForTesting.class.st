Class {
	#name : #GtEpiceaPackageFactoryForTesting,
	#superclass : #Object,
	#instVars : [
		'createdPackages'
	],
	#category : #'GToolkit4Epicea-Factories'
}

{ #category : #cleanup }
GtEpiceaPackageFactoryForTesting >> cleanUp [
	createdPackages do: [ :aPackage |
		(self packageOrganizer includesPackageNamed: aPackage name) ifTrue: [
			self removePackage: aPackage ] ]
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> createNewPackageNamed: aPackageName [
	| newPackage |
	newPackage := Package named: aPackageName.
	self forPharo12: 
		[ self assert: (self class packageOrganizer hasPackage: aPackageName) not
			description: [ 'Package ', aPackageName printString, ' already exists' ].
			self class packageOrganizer addPackage: newPackage ] 
	forPharo11AndPharo10: 
		[
		newPackage register ].
	
	createdPackages add: newPackage.

	^ newPackage
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> createNewTagNamed: aTagName inPackageNamed: aPackageName [
	| hasTag |
	
	hasTag := self forPharo12: 
		[ (self packageNamed: aPackageName) hasTag: aTagName ]
	forPharo11AndPharo10:
		[ (self packageNamed: aPackageName) tags anySatisfy:
			[ :rPackage | rPackage name = aTagName ] ].
	self assert: hasTag not
		description: [ 'Tag ', aTagName printString, ' already exists in ', aPackageName printString ].
	(self packageNamed: aPackageName) addClassTag: aTagName
]

{ #category : #initialization }
GtEpiceaPackageFactoryForTesting >> initialize [

	super initialize.
	createdPackages := IdentitySet new.
]

{ #category : #accessing }
GtEpiceaPackageFactoryForTesting >> packageNamed: aPackageName [
	^ self packageOrganizer packageNamed: aPackageName.
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> removePackage: aPackage [ 
	self packageOrganizer unregisterPackage: aPackage.
	self 
		forPharo12: [] 
		forPharo11AndPharo10: [
			SystemOrganizer default removeCategory: aPackage name ]
]
