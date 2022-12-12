Class {
	#name : #GtEpReplayAbstractBehaviorModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'methods',
		'protocolChanges',
		'removedMethods'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addMethodAddition: anOmEntry [
	| method |

	method := self ensureMethodAt: anOmEntry content methodAffectedSelector.
	method addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addMethodChange: anOmEntry [
	| method |

	method := self ensureMethodAt: anOmEntry content methodAffectedSelector.
	method addMethodChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addMethodModification: anOmEntry [
	| method |

	method := self ensureMethodAt: anOmEntry content methodAffectedSelector.
	method addMethodModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addMethodRemoval: anOmEntry [
	| method |

	method := self ensureMethodAt: anOmEntry content methodAffectedSelector.
	method addMethodRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addProtocolAddition: anOmEntry [
	| protocolChange |
	
	protocolChange := self ensureProtocolAt: anOmEntry content protocol.
	protocolChange addProtocolChange: anOmEntry.
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> behaviorAffectedName [

	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> ensureMethodAt: aSymbol [
	"Answer the behavior model for the given name"

	^ methods at: aSymbol ifAbsentPut: [ GtEpReplayMethodModel new ].

]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> ensureProtocolAt: aSymbol [
	"Answer the protocol model for the given name"

	^ protocolChanges at: aSymbol ifAbsentPut: [ GtEpReplayProtocolModel new ].

]

{ #category : #ui }
GtEpReplayAbstractBehaviorModel >> gtMethodsFor: aView [
	<gtView>

	^ aView list
		title: 'Methods';
		priority: 10;
		items: [ methods associations sorted: #key ascending ];
		itemText: [ :item | item key ];
		send: [ :item | item value ];
		actionUpdateButton.
]

{ #category : #ui }
GtEpReplayAbstractBehaviorModel >> gtProtocolsFor: aView [
	<gtView>

	^ aView list
		title: 'Protocols';
		priority: 40;
		items: [ protocolChanges associations ];
		itemText: [ :item | item key ];
		send: [ :item | item value ];
		actionUpdateButton.
]

{ #category : #testing }
GtEpReplayAbstractBehaviorModel >> hasProtocolNamed: aSymbol [
	"Answer a boolean indicating whether the specified protocol exists in the image model."

	^ methods 
		detect: [ :method | method latestEntry content methodAffected protocol = aSymbol. ]
		ifFound: [ :method | true ]
		ifNone: [ false ].

]

{ #category : #initialization }
GtEpReplayAbstractBehaviorModel >> initialize [

	super initialize.
	self reset.

]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodAt: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [

	^ methods at: aSymbol ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methods [

	^ methods
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodsInProtocol: aSymbol [
	"Answer the collection of methods in the supplied protocol."

	^ methods values select: 
		[ :method | method latestEntry content methodAffected protocol = aSymbol ].

]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> protocolChanges [

	^ protocolChanges
]

{ #category : #initialization }
GtEpReplayAbstractBehaviorModel >> reset [ 

	entries := OrderedCollection new.
	methods := IdentityDictionary new.
	protocolChanges := IdentityDictionary new.
	removedMethods := OrderedCollection new.
]
