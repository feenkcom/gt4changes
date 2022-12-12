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
		(RPackage organizer includesPackageNamed: aPackage name) ifTrue: [
			self removePackage: aPackage ] ]
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> createNewPackageNamed: aPackageName [
	| newPackage |
	
	newPackage := RPackage named: aPackageName.
	newPackage register.
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
	^ RPackage organizer packageNamed: aPackageName.
]

{ #category : #actions }
GtEpiceaPackageFactoryForTesting >> removePackage: aPackage [ 
	RPackage organizer unregisterPackage: aPackage.
	SystemOrganizer default removeCategory: aPackage name
]
