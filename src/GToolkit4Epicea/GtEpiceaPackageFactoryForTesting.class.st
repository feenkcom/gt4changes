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
	self 
			assert: (self class packageOrganizer hasPackage: aPackageName) not
			description: [ 'Package ', aPackageName printString, ' already exists' ].
	self class packageOrganizer addPackage: newPackage .
	
	createdPackages add: newPackage.

	^ newPackage
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> createNewTagNamed: aTagName inPackageNamed: aPackageName [
	| hasTag |
	
	hasTag := (self packageNamed: aPackageName) hasTag: aTagName.
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
]
