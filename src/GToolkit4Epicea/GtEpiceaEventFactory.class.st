"
A GtEpiceaEventFactory provides a convenient way to generate a sequence of Epicea events programatically.  These events are typically then used for testing.
"
Class {
	#name : #GtEpiceaEventFactory,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'GToolkit4Epicea-Factories'
}

{ #category : #api }
GtEpiceaEventFactory >> addCategory: categoryName packageName: packageName tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryAddition basicNew
			initializeNamed: categoryName packageName: packageName;
			yourself ))
]

{ #category : #api }
GtEpiceaEventFactory >> addClass: aClassDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content: 
		(EpClassAddition class: aClassDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> addMethod: aMethodDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpMethodAddition method: aMethodDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> addProtocol: aSymbol in: aBehavior tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpProtocolAddition behavior: aBehavior protocol: aSymbol))
]

{ #category : #api }
GtEpiceaEventFactory >> addSessionSnapshotImageName: aString tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpSessionSnapshot imageName: aString))
]

{ #category : #api }
GtEpiceaEventFactory >> addTrait: aTraitDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content: 
		(EpTraitAddition trait: aTraitDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> changeBehaviorFrom: oldCategoryName package: oldPackageName to: newCategoryName in: aBehavior tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		((EpBehaviorCategoryChange oldCategory: oldCategoryName newCategory: newCategoryName class: aBehavior)
			oldPackageName: oldPackageName))
]

{ #category : #api }
GtEpiceaEventFactory >> changeCommentFrom: oldComment stamp: oldStamp to: newComment stamp: newStamp in: aRgClassDefinition tags: aDictionary [

	entries add: (self omEntryFrom: aDictionary content: (EpBehaviorCommentChange
		newWithBehavior: aRgClassDefinition
		oldComment: oldComment
		newComment: newComment
		oldStamp: oldStamp
		newStamp: newStamp))
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> classComment: aString [

	^ RGCommentDefinition new
		content: aString
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> classDefinitionName: className definitionSource: definitionSource superclassName: superclassName package: packageName packageTag: packageTag classVariables: classVariables instanceVariables: instanceVariables sharedPools: sharedPools comment: anRgCommentDefinition [
	| classDefinition |

	classDefinition := RGClassDefinition named: className.
	classDefinition
		definitionSource: definitionSource;
		superclassName: superclassName;
		category: (packageTag
			ifNil: [ packageName ]
			ifNotNil: [ packageName, '-', packageTag ]);
		package: packageName;
		comment: anRgCommentDefinition.
	classVariables do: [ :cv | classDefinition addClassVariable: cv ].
	instanceVariables do: [ :iv | classDefinition addInstanceVariable: iv ].
	sharedPools do: [ :sp | classDefinition addSharedPool: sp ].
	anRgCommentDefinition parent: classDefinition.

	^ classDefinition
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> classVariableDefinitionNamed: variableName className: className isMeta: isMeta [

	^ RGClassVariableDefinition named: variableName
]

{ #category : #accessing }
GtEpiceaEventFactory >> entries [

	^ entries
]

{ #category : #api }
GtEpiceaEventFactory >> genericRefactoring: aString tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content: 
		(EpGenericRefactoring for: aString))
]

{ #category : #initialization }
GtEpiceaEventFactory >> initialize [

	super initialize.
	entries := OrderedCollection new.
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> instanceVariableDefinitionNamed: variableName className: className isMeta: isMeta [

	^ RGInstanceVariableDefinition named: variableName
]

{ #category : #api }
GtEpiceaEventFactory >> logBrowserOperation: aCollection tags: aDictionary [

self halt.
	^ entries add: (self omEntryFrom: aDictionary content: 
		(EpClassAddition class: aCollection))
]

{ #category : #api }
GtEpiceaEventFactory >> logRedo: aCollection tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content: 
		(EpRedo forAll: aCollection))
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> metaclassDefinitionName: aClassName definitionSource: definitionSource instanceVariables: instanceVariables [
	| className classDefinition |

	className := (aClassName endsWith: ' class')
		ifTrue: [ aClassName ]
		ifFalse: [ aClassName, ' class' ].
	classDefinition := RGMetaclassDefinition named: className.
	classDefinition definitionSource: definitionSource.
	instanceVariables do: [ :iv | classDefinition addInstanceVariable: iv ].

	^ classDefinition
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> metatraitDefinitionName: aClassName definitionSource: definitionSource [
	| className classDefinition |

	className := (aClassName endsWith: ' classTrait')
		ifTrue: [ aClassName ]
		ifFalse: [ aClassName, ' classTrait' ].
	classDefinition := RGMetatraitDefinition named: className.
	classDefinition definitionSource: definitionSource.

	^ classDefinition
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> methodDefinitionSelector: selector className: className meta: aBoolean package: packageName protocol: protocol sourceCode: sourceCode stamp: stamp [
	| methodDefinition |

	methodDefinition := RGMethodDefinition named: selector.
	methodDefinition
		parentName: className;
		isMetaSide: aBoolean;
		sourceCode: sourceCode;
		protocol: protocol;
		package: packageName;
		stamp: stamp.
	^ methodDefinition.
]

{ #category : #api }
GtEpiceaEventFactory >> modifyClass: oldClassDefinition to: newClassDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpClassModification oldClass: oldClassDefinition newClass: newClassDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> modifyMethod: oldMethodDefinition to: newMethodDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpMethodModification oldMethod: oldMethodDefinition newMethod: newMethodDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> modifyTrait: oldTraitDefinition to: newTraitDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpTraitModification oldTrait: oldTraitDefinition newTrait: newTraitDefinition))
]

{ #category : #private }
GtEpiceaEventFactory >> omEntryFrom: aDictionary content: anEpEvent [ 
	| entry |

	entry := OmEntry content: anEpEvent.
	aDictionary keysAndValuesDo: [ :key :value | | tagValue |
		tagValue := key = #time
			ifTrue: [ DateAndTime readFromString: value ]
			ifFalse: [ value ].
		entry tags at: key put: tagValue ].
	^ entry
]

{ #category : #api }
GtEpiceaEventFactory >> registerCategory: categoryName packageName: packageName tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryRegistration basicNew
			initializeNamed: categoryName packageName: packageName;
			yourself ))
]

{ #category : #api }
GtEpiceaEventFactory >> removeCategory: categoryName packageName: packageName tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryRemoval basicNew
			initializeNamed: categoryName packageName: packageName;
			yourself ))
]

{ #category : #api }
GtEpiceaEventFactory >> removeClass: aClassDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpClassRemoval class: aClassDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> removeMethod: aMethodDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpMethodRemoval method: aMethodDefinition)).
]

{ #category : #api }
GtEpiceaEventFactory >> removeProtocol: aSymbol in: aBehavior tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpProtocolRemoval behavior: aBehavior protocol: aSymbol))
]

{ #category : #api }
GtEpiceaEventFactory >> removeTrait: aTraitDefinition tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpTraitRemoval trait: aTraitDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> renameCategory: oldCategoryName to: newCategoryName packageName: packageName tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryRename basicNew
			initializeOldName: oldCategoryName newName: newCategoryName packageName: packageName;
			yourself ))
]

{ #category : #api }
GtEpiceaEventFactory >> renameClass: classDefinition from: aSymbol tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpBehaviorNameChange 
			oldName: aSymbol
			newName: classDefinition name
			class: classDefinition))
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> traitDefinitionName: className definitionSource: definitionSource superclassName: superclassName package: packageName packageTag: packageTag classVariables: classVariables instanceVariables: instanceVariables sharedPools: sharedPools comment: anRgCommentDefinition [
	| classDefinition |

	classDefinition := RGTraitDefinition named: className.
	classDefinition
		definitionSource: definitionSource;
		superclassName: superclassName;
		category: (packageTag
			ifNil: [ packageName ]
			ifNotNil: [ packageName, '-', packageTag ]);
		package: packageName;
		comment: anRgCommentDefinition.
	classVariables do: [ :cv | classDefinition addClassVariable: cv ].
	instanceVariables do: [ :iv | classDefinition addInstanceVariable: iv ].
	sharedPools do: [ :sp | classDefinition addSharedPool: sp ].
	anRgCommentDefinition parent: classDefinition.

	^ classDefinition
]
