Class {
	#name : #GtStonEpCategoryChangeMigrator,
	#superclass : #GtStonClassMigrator,
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #converting }
GtStonEpCategoryChangeMigrator class >> tagFromCategory: categoryName package: packageName [
	| tagName |

	tagName := categoryName withoutPrefix: packageName.
	(tagName isNotEmpty and: [ tagName first = $- ]) ifTrue:
		[ tagName := tagName allButFirst ].
	^ tagName
]
