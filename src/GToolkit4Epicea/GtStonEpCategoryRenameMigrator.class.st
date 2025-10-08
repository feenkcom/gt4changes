Class {
	#name : #GtStonEpCategoryRenameMigrator,
	#superclass : #GtStonEpCategoryChangeMigrator,
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #migrating }
GtStonEpCategoryRenameMigrator >> migrate: anObject [
	| instVars category package packageTag |

	instVars := anObject instanceVariables.
self halt.
	(instVars includesKey: 'category') ifFalse:
		[ ^ super migrate: anObject ].

	category := instVars removeKey: 'category'.
	package := instVars at: 'package'.
	packageTag := category withoutPrefix: package.
	(packageTag isNotEmpty and: [ packageTag first = $- ]) ifTrue:
		[ packageTag := packageTag allButFirst ].
	instVars at: 'packageTag' put: packageTag.

	super migrate: anObject.
]

{ #category : #accessing }
GtStonEpCategoryRenameMigrator >> targetClassName [

	^ #EpCategoryRename
]
