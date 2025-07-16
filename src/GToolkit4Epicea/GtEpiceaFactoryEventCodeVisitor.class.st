"
GtEpiceaFactoryEventCodeVisitor walks over an existing collection of {{gtClass:EpEvent}}s and produces code that reproduces the input events.

This code is then typically saved for use in other examples.
"
Class {
	#name : #GtEpiceaFactoryEventCodeVisitor,
	#superclass : #Object,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#instVars : [
		'selector',
		'codeStream',
		'entries',
		'currentEntry'
	],
	#category : #'GToolkit4Epicea-Visitor'
}

{ #category : #actions }
GtEpiceaFactoryEventCodeVisitor class >> selector: aSymbol entries: aCollection [
	"Answer a receiver with the code for the supplied collection of OmEntries named aSymbol"

	^ self new
		selector: aSymbol;
		entries: aCollection
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> appendTagsKeywordFrom: anOmEntry [

	codeStream
		<< ' tags: { #author -> ';
		print: (anOmEntry tagAt: #author);
		<< '. #time -> ';
		print: anOmEntry gtTime printString;
		<< '. } asDictionary'.
]

{ #category : #accessing }
GtEpiceaFactoryEventCodeVisitor >> entries [
	^ entries
]

{ #category : #accessing }
GtEpiceaFactoryEventCodeVisitor >> entries: anObject [
	entries := anObject
]

{ #category : #initialization }
GtEpiceaFactoryEventCodeVisitor >> generate [

	codeStream := String new writeStream.
	codeStream
		<< selector; cr; 
		tab; << '| factory |'; cr;
		cr;
		tab; << 'factory := GtEpiceaEventFactory new.'; cr;
		cr.
	entries do: [ :entry |
		currentEntry := entry.
		entry content accept: self ].
	codeStream
		cr;
		tab; << '^ factory'; cr.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> packageTagOfClass: aRgClass [
	| categoryName packageName |

	categoryName := aRgClass category.
	packageName := aRgClass package.
	categoryName = packageName ifTrue: [ ^ nil ].
	packageName isString ifFalse:
		[ packageName := packageName name ].
	categoryName = packageName ifTrue: [ ^ nil ].
	^ (categoryName withoutPrefix: packageName) allButFirst asSymbol
]

{ #category : #accessing }
GtEpiceaFactoryEventCodeVisitor >> selector [
	^ selector
]

{ #category : #accessing }
GtEpiceaFactoryEventCodeVisitor >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
GtEpiceaFactoryEventCodeVisitor >> sourceCode [

	codeStream ifNil: [ self generate ].
	^ codeStream contents
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeBehaviorDefinitionFor: aRgBehavior [

	^ aRgBehavior isTrait ifTrue: 
		[ self storeTraitDefinitionFor: aRgBehavior ]
	ifFalse: 
		[ aRgBehavior isMeta
			ifTrue: [ self storeMetaclassDefinitionFor: aRgBehavior ]
			ifFalse: [ self storeClassDefinitionFor: aRgBehavior ] ]
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeClassComment: aRgClassComment [

	codeStream
		<< '(factory classComment: ';
		print: (aRgClassComment 
			ifNil: [ '' ]
			ifNotNil: [ :rgComment | rgComment content ]);
		<< ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeClassDefinitionFor: aRgClass [

	codeStream << '('.
	self storeOnlyClassDefinitionFor: aRgClass.
	aRgClass classSide ifNotNil:
		[ codeStream << ' withMetaclass: '.
		self storeOnlyMetaclassDefinitionFor: aRgClass classSide ].
	codeStream << ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeClassVariableDefinition: var [ 

	codeStream
		<< 'factory classVariableDefinitionNamed: ';
		print: var name;
		<< ' className: ';
		print: var className;
		<< ' isMeta: ';
		print: var isMetaSide.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeClassVariables: aCollection [

	aCollection ifEmpty: 
		[ codeStream << 'OrderedCollection new'.
		^ self ].
	codeStream
		<< '(OrderedCollection withAll: { '.
	aCollection
		do: [ :var | self storeClassVariableDefinition: var ]
		separatedBy: [ codeStream << '. ' ].
	codeStream
		<< '})'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeInstanceVariableDefinition: var [ 

	codeStream
		<< 'factory instanceVariableDefinitionNamed: ';
		print: var name;
		<< ' className: ';
		print: var className;
		<< ' isMeta: ';
		print: var isMetaSide.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeInstanceVariables: aCollection [

	aCollection ifEmpty: 
		[ codeStream << 'OrderedCollection new'.
		^ self ].
	codeStream
		<< '(OrderedCollection withAll: { '.
	aCollection
		do: [ :var | self storeInstanceVariableDefinition: var ]
		separatedBy: [ codeStream << '. ' ].
	codeStream
		<< '})'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeMetaclassDefinitionFor: aRgMetaclass [

	codeStream << '('.
	self storeOnlyMetaclassDefinitionFor: aRgMetaclass.
	codeStream << ' baseClass: '.
	self storeOnlyClassDefinitionFor: aRgMetaclass instanceSide.
	codeStream << ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeMethodDefinitionFor: aRgMethodDefinition [

	codeStream
		<< '(factory methodDefinitionSelector: ';
		print: aRgMethodDefinition selector;
		<< ' className: ';
		print: aRgMethodDefinition parentName;
		<< ' meta: ';
		print: aRgMethodDefinition isMetaSide;
		<< ' package: ';
		print: aRgMethodDefinition package;
		<< ' protocol: ';
		print: aRgMethodDefinition protocol;
		<< ' sourceCode: ';
		print: aRgMethodDefinition sourceCode;
		<< ' stamp: ';
		print: aRgMethodDefinition stamp;
		<< ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeOnlyClassDefinitionFor: aRgClass [
	codeStream
		<< '(factory classDefinitionName: ';
		print: aRgClass name;
		<< ' definitionSource: ';
		print: aRgClass definitionSource;
		<< ' superclassName: ';
		print: aRgClass superclassName;
		<< ' package: ';
		print: aRgClass package;
		<< ' packageTag: ';
		print: (self packageTagOfClass: aRgClass);
		<< ' classVariables: '.
	self storeClassVariables: aRgClass classVariables.
	codeStream << ' instanceVariables: '.
	self storeInstanceVariables: aRgClass instanceVariables.
	codeStream << ' sharedPools: '.
	self storeSharedPools: aRgClass sharedPools.
	codeStream << ' comment: '.
	self storeClassComment: aRgClass comment.
	codeStream
		<< ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeOnlyMetaclassDefinitionFor: aRgMetaclass [

	codeStream 
		<< '(factory metaclassDefinitionName: '
		print: aRgMetaclass name;
		<< ' definitionSource: ';
		print: aRgMetaclass definitionSource;
		<< ' instanceVariables: '.
	self storeInstanceVariables: aRgMetaclass instanceVariables.
	codeStream
		<< ')'.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeSharedPools: aCollection [

	aCollection ifEmpty: 
		[ codeStream << 'OrderedCollection new'.
		^ self ].
	self halt.
]

{ #category : #private }
GtEpiceaFactoryEventCodeVisitor >> storeTraitDefinitionFor: aRgClass [
	| metaClass |

	metaClass := aRgClass classSide.
	codeStream
		<< '((factory traitDefinitionName: ';
		print: aRgClass name;
		<< ' definitionSource: ';
		print: aRgClass definitionSource;
		<< ' superclassName: ';
		print: aRgClass superclassName;
		<< ' package: ';
		print: aRgClass package;
		<< ' packageTag: #';
		print: (self packageTagOfClass: aRgClass);
		<< ' classVariables: '.
	self storeClassVariables: aRgClass classVariables.
	codeStream << ' instanceVariables: '.
	self storeInstanceVariables: aRgClass instanceVariables.
	codeStream << ' sharedPools: '.
	self storeSharedPools: aRgClass sharedPools.
	codeStream << ' comment: '.
	self storeClassComment: aRgClass comment.
	codeStream 
		<< ') withMetaclass: (factory metatraitDefinitionName: '
		print: metaClass name;
		<< ' definitionSource: ';
		print: metaClass definitionSource;
		<< '))'.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitBehaviorCategoryChange: aChange [

	codeStream
		tab;
		<< 'factory changeBehaviorFrom: ';
		print: aChange oldCategory;
		<< ' package: ';
		print: aChange oldPackageName;
		<< ' to: ';
		print: aChange newCategory;
		<< ' in: '.
	self storeBehaviorDefinitionFor: aChange behaviorAffected.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitBehaviorCommentChange: aChange [

	codeStream
		tab;
		<< 'factory changeCommentFrom: ';
		print: aChange oldComment;
		<< ' stamp: ';
		print: aChange oldStamp;
		<< ' to: ';
		print: aChange newComment;
		<< ' stamp: ';
		print: aChange newStamp;
		<< ' in: '.
	self storeBehaviorDefinitionFor: aChange behaviorAffected.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitBehaviorNameChange: aChange [

	codeStream
		tab;
		<< 'factory renameClass: '.
	self storeBehaviorDefinitionFor: aChange behaviorAffected.
	codeStream
		<< ' from: ';
		print: aChange oldName.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCategoryAddition: aChange [

	codeStream
		tab;
		<< 'factory addCategory: ';
		print: aChange categoryName;
		<< ' packageName: ';
		print: aChange affectedPackageName.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCategoryChange: aChange [
	^ self error: 'Unexpected visit'.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCategoryRegistration: aChange [

	codeStream
		tab;
		<< 'factory registerCategory: ';
		print: aChange categoryName;
		<< ' packageName: ';
		print: aChange affectedPackageName.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCategoryRemoval: aChange [
	codeStream
		tab;
		<< 'factory removeCategory: ';
		print: aChange categoryName;
		<< ' packageName: ';
		print: aChange affectedPackageName.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCategoryRename: aChange [

	codeStream
		tab;
		<< 'factory renameCategory: ';
		print: aChange oldCategoryName;
		<< ' to: ';
		print: aChange newCategoryName;
		<< ' packageName: ';
		print: aChange affectedPackageName.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitClassAddition: aChange [

	codeStream
		tab;
		<< 'factory addClass: '.
	self storeClassDefinitionFor: aChange classAdded.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitClassModification: aChange [

	codeStream
		tab;
		<< 'factory modifyClass: '.
	self storeClassDefinitionFor: aChange oldClass.
	codeStream
		<< ' to: '.
	self storeClassDefinitionFor: aChange newClass.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitClassRemoval: aChange [
	
	codeStream
		<< 'factory removeClass: '.
	self storeClassDefinitionFor: aChange classRemoved.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitCodeChange: aChange [
	"If we get here a method earlier in the stack is not yet implemented."

	^ self notYetImplemented
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitMethodAddition: aChange [

	codeStream
		tab;
		<< 'factory addMethod: '.
	self storeMethodDefinitionFor: aChange methodAdded.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitMethodChange: aChange [

self halt.
	codeStream
		tab;
		<< 'factory changeFromSource: ';
		print: aChange oldMethod sourceCode;
		<< ' protocol: ';
		print: aChange oldMethod protocol;
		<< ' toSource: ';
		print: aChange newMethod sourceCode;
		<< ' protocol: ';
		print: aChange newMethod protocol;
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitMethodModification: aChange [

	codeStream
		tab;
		<< 'factory modifyMethod: '.
	self storeMethodDefinitionFor: aChange oldMethod.
	codeStream << ' to: '.
	self storeMethodDefinitionFor: aChange newMethod.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitMethodRemoval: aChange [

	codeStream
		tab;
		<< 'factory removeMethod: '.
	self storeMethodDefinitionFor: aChange methodRemoved.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitProtocolAddition: aProtocolAddition [

	codeStream
		<< 'factory addProtocol: ';
		print: aProtocolAddition protocol;
		<< ' in: '.
	self storeBehaviorDefinitionFor: aProtocolAddition behaviorAffected.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitProtocolRemoval: aProtocolRemoved [

	codeStream
		<< 'factory removeProtocol: ';
		print: aProtocolRemoved protocol;
		<< ' in: '.
	self storeBehaviorDefinitionFor: aProtocolRemoved behaviorAffected.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitRedo: anEpRedo [
	"Nothing to do"
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitRefactoring: aChange [
	"No known action required"
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitSessionSnapshot: anEpSessionSnapshot [
	"Nothing to do"
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitTraitAddition: aChange [

	codeStream
		tab;
		<< 'factory addTrait: '.
	self storeTraitDefinitionFor: aChange traitAdded.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitTraitModification: aChange [

	codeStream
		tab;
		<< 'factory modifyTrait: '.
	self storeTraitDefinitionFor: aChange oldTrait.
	codeStream
		<< ' to: '.
	self storeTraitDefinitionFor: aChange newTrait.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]

{ #category : #visitor }
GtEpiceaFactoryEventCodeVisitor >> visitTraitRemoval: aChange [

	codeStream
		<< 'factory removeTrait: '.
	self storeTraitDefinitionFor: aChange traitRemoved.
	self appendTagsKeywordFrom: currentEntry.
	codeStream
		<< '.';
		cr.
]
