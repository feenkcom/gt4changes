Class {
	#name : #GtStonObjectMigrator,
	#superclass : #Object,
	#instVars : [
		'defaultMigration',
		'classMigrators'
	],
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #'instance creation' }
GtStonObjectMigrator class >> forPharo11Epicea [

	^ self new
		addClassMigrator: GtStonRGClassDefinitionMigrator new;
		addClassMigrator: GtStonEpCategoryAdditionMigrator new;
		addClassMigrator: GtStonEpCategoryRegistrationMigrator new;
		addClassMigrator: GtStonEpCategoryRenameMigrator new;
		addClassMigrator: GtStonEpCategoryRemovalMigrator new.
]

{ #category : #'as yet unclassified' }
GtStonObjectMigrator >> addClassMigrator: aMigrator [

	classMigrators at: aMigrator targetClassName put: aMigrator
]

{ #category : #'as yet unclassified' }
GtStonObjectMigrator >> defaultMigrationBlock [

	^ [ :object |
		object instanceVariables keysAndValuesDo: [ :instVarName :instVarValue |
			object targetInstance instVarNamed: instVarName put: instVarValue ] ]
]

{ #category : #'as yet unclassified' }
GtStonObjectMigrator >> initialize [

	super initialize.
	defaultMigration := self defaultMigrationBlock.
	classMigrators := Dictionary new.
]

{ #category : #'as yet unclassified' }
GtStonObjectMigrator >> migrate: object [

	classMigrators
		at: object targetClassName
		ifPresent: [ :migrator | migrator migrate: object ]
		ifAbsent: [ defaultMigration value: object ]
]
