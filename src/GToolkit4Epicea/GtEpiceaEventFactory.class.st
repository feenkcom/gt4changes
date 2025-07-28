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

	^ self forPharo12: 
		[ entries add: (self omEntryFrom: aDictionary content:
			(EpPackageAddition packageName: packageName)).
		(self tagFromCategory: categoryName package: packageName) ifNotNil: [ :tag |
			entries add: (self omEntryFrom: aDictionary content:
			(EpPackageTagAddition tagName: tag packageName: packageName)) ] ] 
	forPharo11AndPharo10:
		[ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryAddition basicNew
			initializeNamed: categoryName packageName: packageName;
			yourself )) ]
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
GtEpiceaEventFactory >> addPackage: aSymbol tag: tagSymbol tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpPackageTagAddition tagName: tagSymbol packageName: aSymbol))
]

{ #category : #api }
GtEpiceaEventFactory >> addPackage: aSymbol tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpPackageAddition packageName: aSymbol))
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

	^ self forPharo12: 
		[ entries add: (self omEntryFrom: aDictionary content:
		(EpBehaviorRepackagedChange
			oldPackage: oldPackageName
			oldTag: (self tagFromCategory: oldCategoryName package: oldPackageName)
			newPackage: aBehavior packageName
			newTag: aBehavior packageTag
			class: aBehavior))] 
	forPharo11AndPharo10:
		[ entries add: (self omEntryFrom: aDictionary content:
		((EpBehaviorCategoryChange oldCategory: oldCategoryName newCategory: newCategoryName class: aBehavior)
			oldPackageName: oldPackageName)) ]
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
		comment: anRgCommentDefinition.
	self forPharo12: 
		[ classDefinition
			package: (self packageDefinitionNamed: packageName);
			packageTag: packageTag ] 
	forPharo11AndPharo10: 
		[ classDefinition 
			category: (packageTag
				ifNil: [ packageName ]
				ifNotNil: [ packageName, '-', packageTag ]);
			package: packageName ].
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

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> packageDefinitionNamed: packageName [

	^ RGPackageDefinition named: packageName
]

{ #category : #api }
GtEpiceaEventFactory >> rePackage: aBehaviorDefinition oldPackageName: oldPackageName oldTagName: oldTagName newPackageName: newPackageName newTagName: newTagName tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpBehaviorRepackagedChange oldPackage: oldPackageName oldTag: oldTagName newPackage: newPackageName newTag: newTagName class: aBehaviorDefinition))
]

{ #category : #api }
GtEpiceaEventFactory >> registerCategory: categoryName packageName: packageName tags: aDictionary [

	^ self forPharo12:
		[ entries add: (self omEntryFrom: aDictionary content:
		(EpPackageAddition packageName: packageName)).
		(categoryName asString withoutPrefix: packageName asString) ifNotEmpty: [ :tag |
			entries add: (self omEntryFrom: aDictionary content:
			(EpPackageTagAddition tagName: tag asSymbol packageName: packageName)) ] ]
	forPharo11AndPharo10: 
		[ entries add: (self omEntryFrom: aDictionary content:
		(EpCategoryRegistration basicNew
			initializeNamed: categoryName packageName: packageName;
			yourself)) ]
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
GtEpiceaEventFactory >> removePackage: aSymbol tag: tagSymbol tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpPackageTagRemoval tagName: tagSymbol packageName: aSymbol))
]

{ #category : #api }
GtEpiceaEventFactory >> removePackage: aSymbol tags: aDictionary [

	^ entries add: (self omEntryFrom: aDictionary content:
		(EpPackageRemoval packageName: aSymbol))
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

{ #category : #private }
GtEpiceaEventFactory >> tagFromCategory: categoryName package: packageName [

	categoryName = packageName ifTrue: [ ^ nil ].
	packageName ifNil: [ ^ categoryName ].
	self notYetTested.
	^ (categoryName withoutPrefix: packageName) allButFirst asSymbol
]

{ #category : #'api - definitions' }
GtEpiceaEventFactory >> traitDefinitionName: className definitionSource: definitionSource superclassName: superclassName package: packageName packageTag: packageTag classVariables: classVariables instanceVariables: instanceVariables sharedPools: sharedPools comment: anRgCommentDefinition [
	| traitDefinition |

	traitDefinition := RGTraitDefinition named: className.
	traitDefinition
		definitionSource: definitionSource;
		superclassName: superclassName.
	self forPharo12: 
		[ traitDefinition
			package: (self packageDefinitionNamed: packageName);
			packageTag: packageTag ] 
	forPharo11AndPharo10: 
		[ traitDefinition 
			category: (packageTag
				ifNil: [ packageName ]
				ifNotNil: [ packageName, '-', packageTag ]);
			package: packageName ].
	traitDefinition comment: anRgCommentDefinition.
	classVariables do: [ :cv | traitDefinition addClassVariable: cv ].
	instanceVariables do: [ :iv | traitDefinition addInstanceVariable: iv ].
	sharedPools do: [ :sp | traitDefinition addSharedPool: sp ].
	anRgCommentDefinition parent: traitDefinition.

	^ traitDefinition.
]
