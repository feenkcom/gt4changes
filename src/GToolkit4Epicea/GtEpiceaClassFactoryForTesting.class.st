Class {
	#name : #GtEpiceaClassFactoryForTesting,
	#superclass : #ClassFactoryForTestCase,
	#instVars : [
		'currentPackageName'
	],
	#category : #'GToolkit4Epicea-Factories'
}

{ #category : #accessing }
GtEpiceaClassFactoryForTesting >> currentPackageName [

	^ currentPackageName ifNil: [ self defaultPackageName]
]

{ #category : #accessing }
GtEpiceaClassFactoryForTesting >> currentPackageName: aPackageName [

	currentPackageName := aPackageName
]

{ #category : #accessing }
GtEpiceaClassFactoryForTesting >> defaultPackageName [
	^ #CategoryForTestToBeDeleted
]

{ #category : #'actions - creation' }
GtEpiceaClassFactoryForTesting >> newClassInPackageNamed: aPackageName withTagNamed: aTagName [
	self currentPackageName: aPackageName.
	^ self newClassInTagNamed:  aTagName.
]

{ #category : #'actions - creation' }
GtEpiceaClassFactoryForTesting >> newClassInTagNamed: aTagName [
	
	^ self 
		forPharo12: [ self make: [ :aBuilder | aBuilder tag: aTagName ] ]
		forPharo11AndPharo10: [ self newClassInCategory: aTagName ]
]

{ #category : #accessing }
GtEpiceaClassFactoryForTesting >> packageName [
	"We override this method here to be able to change the package name"
	^ self currentPackageName
]

{ #category : #'actions - editing' }
GtEpiceaClassFactoryForTesting >> redefineClass: aClass inPackageNamed: aPackageName withTagName: aTagName [

	^ self forPharo12: 
		[ self update: aClass to: [ :aBuilder |
		aBuilder
			package: aPackageName;
			tag: aTagName ] ]
	forPharo11AndPharo10:
		[ self 
		redefineClass: aClass 
		category: (aPackageName, '-', aTagName) asSymbol ]
]
