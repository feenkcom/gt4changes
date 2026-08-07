"
GtStonObjectModel holds the instance variables of an object separately from the instance being created.  The instance variables are then migrated in to the instance after the object has been loaded.
"
Class {
	#name : #GtStonObjectModel,
	#superclass : #Object,
	#instVars : [
		'targetClassName',
		'instanceVariables',
		'targetInstance'
	],
	#category : #'GToolkit4Epicea-Reader'
}

{ #category : #'as yet unclassified' }
GtStonObjectModel >> initialize [

	super initialize.
	instanceVariables := OrderedDictionary new.
]

{ #category : #accessing }
GtStonObjectModel >> instanceVariables [
	^ instanceVariables
]

{ #category : #accessing }
GtStonObjectModel >> instanceVariables: anObject [
	instanceVariables := anObject
]

{ #category : #'as yet unclassified' }
GtStonObjectModel >> stonProcessSubObjects: block [
	"Execute block to (potentially) change each of my subObjects.
	In general, all instance and indexable variables are processed.
	Overwrite when necessary. Not used when #stonContainSubObjects returns false."

	1 to: instanceVariables size do: [ :each | | key |
		key := instanceVariables keys at: each.
		instanceVariables at: key put: 
			(block value: (instanceVariables at: key)) ].
	targetInstance stonProcessSubObjects: block.
]

{ #category : #accessing }
GtStonObjectModel >> targetClassName [
	^ targetClassName
]

{ #category : #accessing }
GtStonObjectModel >> targetClassName: anObject [
	targetClassName := anObject
]

{ #category : #accessing }
GtStonObjectModel >> targetInstance [
	^ targetInstance
]

{ #category : #accessing }
GtStonObjectModel >> targetInstance: anObject [
	targetInstance := anObject
]
