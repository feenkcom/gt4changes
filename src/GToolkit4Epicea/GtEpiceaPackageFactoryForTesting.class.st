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
		forPharo12: [
			self class packageOrganizer addPackage: newPackage ] 
		forPharo11AndPharo10: [
			newPackage register ].
	
	createdPackages add: newPackage.

	^ newPackage
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> createNewTagNamed: aTagName inPackageNamed: aPackageName [
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
