"
EpEvent equality tests (#=) are inconsistently defined and mostly very shallow.

GtEpEventEqualtiyVisitor tests the equality of two events of the same class to the depth required by the {{gtClass:GtEpEventSequencer}}.
"
Class {
	#name : #GtEpEventEqualityVisitor,
	#superclass : #Object,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#instVars : [
		'actualEvent'
	],
	#category : #'GToolkit4Epicea-Visitor'
}

{ #category : #accessing }
GtEpEventEqualityVisitor >> actualEvent [
	^ actualEvent
]

{ #category : #accessing }
GtEpEventEqualityVisitor >> actualEvent: anObject [
	actualEvent := anObject
]

{ #category : #private }
GtEpEventEqualityVisitor >> assertBehaviorDefinition: actual equals: expected [

	expected isClass ifTrue: [ ^ self assertClassDefinition: actual equals: expected ].
	expected isTrait ifTrue: [ ^ self assertTraitDefinition: actual equals: expected ].
	self error: 'Unknown behavior definition'.
]

{ #category : #private }
GtEpEventEqualityVisitor >> assertClassDefinition: actual equals: expected [

	self assert: actual class equals: expected class.
	expected class instVarNames do: [ :instVarName |
		self assert: (actual instVarNamed: instVarName)
			equals: (expected instVarNamed: instVarName) ].
]

{ #category : #private }
GtEpEventEqualityVisitor >> assertMethodDefinition: actual equals: expected [

	self assert: actual class equals: expected class.
	expected class instVarNames do: [ :instVarName |
		self assert: (actual instVarNamed: instVarName)
			equals: (expected instVarNamed: instVarName) ].
]

{ #category : #private }
GtEpEventEqualityVisitor >> assertTraitDefinition: actual equals: expected [

	self assert: actual class equals: expected class.
	expected class instVarNames do: [ :instVarName |
		self assert: (actual instVarNamed: instVarName)
			equals: (expected instVarNamed: instVarName) ].
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitBehaviorCategoryChange: aChange [

	self assert: actualEvent oldPackageName equals: aChange oldPackageName.
	self assert: actualEvent oldCategory equals: aChange oldCategory.
	self assert: actualEvent newCategory equals: aChange newCategory.
	self assertBehaviorDefinition: actualEvent behaviorAffected equals: aChange behaviorAffected.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitBehaviorCommentChange: aChange [

	self assertBehaviorDefinition: actualEvent behaviorAffected equals: aChange behaviorAffected.
	self assert: actualEvent oldComment equals: aChange oldComment.
	self assert: actualEvent oldStamp equals: aChange oldStamp.
	self assert: actualEvent newComment equals: aChange newComment.
	self assert: actualEvent newStamp equals: aChange newStamp.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitBehaviorNameChange: aChange [

	self assertClassDefinition: actualEvent behaviorAffected equals: aChange behaviorAffected.
	self assert: actualEvent oldName equals: aChange oldName.
	self assert: actualEvent newName equals: aChange newName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitCategoryAddition: aChange [

	self assert: actualEvent affectedPackageName equals: aChange affectedPackageName.
	self assert: actualEvent categoryName equals: aChange categoryName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitCategoryChange: aChange [

	self assert: actualEvent affectedPackageName
		equals: aChange affectedPackageName.
	self assert: actualEvent categoryName
		equals: aChange categoryName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitCategoryRegistration: aChange [

	self assert: actualEvent affectedPackageName equals: aChange affectedPackageName.
	self assert: actualEvent categoryName equals: aChange categoryName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitCategoryRename: aChange [

	self assert: actualEvent affectedPackageName equals: aChange affectedPackageName.
	self assert: actualEvent categoryName equals: aChange categoryName.
	self assert: actualEvent oldCategoryName equals: aChange oldCategoryName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitClassAddition: aChange [
	
	self assertClassDefinition: actualEvent classAdded equals: aChange classAdded.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitClassModification: aChange [

	self assertClassDefinition: actualEvent oldClass equals: aChange oldClass.
	self assertClassDefinition: actualEvent newClass equals: aChange newClass.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitClassRemoval: aChange [

	self assertClassDefinition: actualEvent classRemoved equals: aChange classRemoved
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitCodeChange: aChange [

	^ self error: 'Change not handled: ', aChange printString.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitMethodAddition: aChange [

	self assertMethodDefinition: actualEvent methodAdded equals: aChange methodAdded
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitMethodModification: aChange [

	self assertMethodDefinition: actualEvent oldMethod equals: aChange oldMethod.
	self assertMethodDefinition: actualEvent newMethod equals: aChange newMethod.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitMethodRemoval: aChange [

	self assertMethodDefinition: actualEvent methodRemoved equals: aChange methodRemoved
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitProtocolAddition: aProtocolAddition [

	self assert: actualEvent protocol equals: aProtocolAddition protocol.
	self assertBehaviorDefinition: actualEvent behaviorAffected equals: aProtocolAddition behaviorAffected.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitProtocolRemoval: aProtocolRemoved [

	self assert: actualEvent protocol equals: aProtocolRemoved protocol.
	self assertBehaviorDefinition: actualEvent behaviorAffected equals: aProtocolRemoved behaviorAffected.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitSessionSnapshot: anEpSessionSnapshot [

	self assert: actualEvent imageName equals: anEpSessionSnapshot imageName.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitTraitAddition: aChange [

	self assertTraitDefinition: actualEvent traitAdded equals: aChange traitAdded.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitTraitModification: aChange [

	self assertTraitDefinition: actualEvent oldTrait equals: aChange oldTrait.
	self assertTraitDefinition: actualEvent newTrait equals: aChange newTrait.
]

{ #category : #visitor }
GtEpEventEqualityVisitor >> visitTraitRemoval: aChange [

	self assertTraitDefinition: actualEvent traitRemoved equals: aChange traitRemoved
]
