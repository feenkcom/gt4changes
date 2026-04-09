Class {
	#name : #GtStonEpCategoryRegistrationMigrator,
	#superclass : #GtStonEpCategoryChangeMigrator,
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #migrating }
GtStonEpCategoryRegistrationMigrator >> migrate: aGtStonObjectModel [
	"Convert the supplied EpCategoryRegistration to either a EpPackageAddition or EpPackageTagAddition"
	| instVars classCategoryName affectedPackageName epEvent |

	instVars := aGtStonObjectModel instanceVariables.
	classCategoryName := instVars at: 'classCategoryName'.
	affectedPackageName := instVars at: 'affectedPackageName'.

	epEvent := classCategoryName = affectedPackageName ifTrue:
		[ EpPackageAddition packageName: affectedPackageName ]
	ifFalse:
		[ EpPackageTagAddition 
			tagName: (self class tagFromCategory: classCategoryName package: affectedPackageName)
			packageName: affectedPackageName ].
	aGtStonObjectModel
		instanceVariables: OrderedDictionary new;
		targetInstance: epEvent.	
]

{ #category : #accessing }
GtStonEpCategoryRegistrationMigrator >> targetClassName [

	^ #EpCategoryRegistration
]
