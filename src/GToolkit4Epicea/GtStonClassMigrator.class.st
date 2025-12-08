Class {
	#name : #GtStonClassMigrator,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #migrating }
GtStonClassMigrator >> migrate: anObject [

	anObject instanceVariables keysAndValuesDo: [ :instVarName :instVarValue |
		anObject targetInstance instVarNamed: instVarName put: instVarValue ]
]

{ #category : #accessing }
GtStonClassMigrator >> targetClassName [

	^ self subclassResponsibility
]
