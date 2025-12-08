Class {
	#name : #GtStonObjectModelReader,
	#superclass : #STONReader,
	#instVars : [
		'stack',
		'migrator'
	],
	#classVars : [
		'Enabled'
	],
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #'enabling/disabling' }
GtStonObjectModelReader class >> disable [

	Enabled := false
]

{ #category : #'enabling/disabling' }
GtStonObjectModelReader class >> enable [

	Enabled := true
]

{ #category : #accessing }
GtStonObjectModelReader class >> enabled [
	"Answer a boolean indicating whether the receiver should be enabled or not.
	Currently this only affects the reader used by {{gtClass:OmSTONEntryReader}}"

	^ self 
		forPharo12AndNewer: [ Enabled ifNil: [ false ] ] 
		forPharo11: [ false ].
]

{ #category : #accessing }
GtStonObjectModelReader class >> enabled: anObject [
	Enabled := anObject
]

{ #category : #'instance creation' }
GtStonObjectModelReader class >> forPharo11Epicea [

	^ self new migrator: GtStonObjectMigrator forPharo11Epicea
]

{ #category : #'as yet unclassified' }
GtStonObjectModelReader >> initialize [

	super initialize.
	stack := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
GtStonObjectModelReader >> migrate: object [

	migrator migrate: object
]

{ #category : #accessing }
GtStonObjectModelReader >> migrator [
	^ migrator
]

{ #category : #accessing }
GtStonObjectModelReader >> migrator: anObject [
	migrator := anObject
]

{ #category : #'as yet unclassified' }
GtStonObjectModelReader >> parseNamedInstVarsFor: anObject [
	self parseMapDo: [ :instVarName :value |
		stack last instanceVariables at: instVarName asString put: value ]
]

{ #category : #'as yet unclassified' }
GtStonObjectModelReader >> parseObject [
	| targetClass reference object |
	[
		reference := self newReference.
		targetClass := self parseClass.
		object := GtStonObjectModel new.
		object targetClassName: targetClass name.
		stack add: object.
		object targetInstance: (targetClass fromSton: self).
		self migrate: object.
		self setReference: reference to: object targetInstance.
		stack removeLast. ]
		on: NotFound
		do: [ :notFound |
			acceptUnknownClasses
				ifTrue: [
					object := STON mapClass new.
					self storeReference: object.
					self parseMapDo: [ :key :value |
						object at: key put: value ].
					object at: STON classNameKey put: notFound object ]
				ifFalse: [ self error: 'Cannot resolve class named ', notFound object printString ] ].
	^ object targetInstance
]

{ #category : #'as yet unclassified' }
GtStonObjectModelReader >> storeInstanceVariablesFor: object [

	object instanceVariables keysAndValuesDo: [ :instVarName :instVarValue |
		object targetInstance instVarNamed: instVarName put: instVarValue ].
]
