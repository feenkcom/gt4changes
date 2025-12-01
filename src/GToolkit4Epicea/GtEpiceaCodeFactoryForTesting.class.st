Class {
	#name : #GtEpiceaCodeFactoryForTesting,
	#superclass : #Object,
	#instVars : [
		'packageFactory',
		'classFactory'
	],
	#category : 'GToolkit4Epicea-Factories'
}

{ #category : #accessing }
GtEpiceaCodeFactoryForTesting >> classFactory [
	^ classFactory ifNil:  [ 
		classFactory := GtEpiceaClassFactoryForTesting new ]
]

{ #category : #cleanup }
GtEpiceaCodeFactoryForTesting >> cleanUp [
	classFactory ifNotNil: [ :aClassFactory |
		aClassFactory cleanUp ].
	
	packageFactory ifNotNil: [ :aPackageFactory |
		aPackageFactory cleanUp ]
]

{ #category : #accessing }
GtEpiceaCodeFactoryForTesting >> packageFactory [
	^ packageFactory ifNil:  [ 
		packageFactory := GtEpiceaPackageFactoryForTesting new ]
]
