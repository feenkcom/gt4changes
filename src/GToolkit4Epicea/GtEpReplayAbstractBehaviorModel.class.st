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

{ #category : #adding }
GtEpReplayAbstractBehaviorModel >> addProtocolRemoval: anOmEntry [
	| protocol protocolChange |

	protocol := anOmEntry content protocol.
	protocolChange := self ensureProtocolAt: protocol.
	protocolChange addProtocolChange: anOmEntry.

	"Protocol removal is dangerous since it can remove methods unexpectedly.
	We choose to potentially leave empty protocols behind rather than accidentally remove methods.
	removedMethodModels := self methodsInProtocol: protocol.
	removedMethods addAll: removedMethodModels.
	removedMethodModels do: [ :each |
		methods removeKey: each selector ]."
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> behaviorAffectedName [

	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> classSide [

	^ self subclassResponsibility
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> currentDefinition [

	^ self environment classOrTraitNamed: self name
]

{ #category : #testing }
GtEpReplayAbstractBehaviorModel >> definesBehaviorInImage: aGtEpReplayImageModel [
	"Answer a boolean indicating whether the receiver defines its class / trait.
	I.e. are there entries which add the behavior."

	^ self subclassResponsibility 
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> ensureMethodAt: aSymbol [
	"Answer the behavior model for the given name"

	^ methods at: aSymbol ifAbsentPut: [ GtEpReplayMethodModel new 
		behaviorModel: self;
		selector: aSymbol ].

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

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> hasChanges [

	^ super hasChanges or:
		[ methods isNotEmpty or:
		[ protocolChanges isNotEmpty or:
		[ removedMethods isNotEmpty ] ] ]
]

{ #category : #testing }
GtEpReplayAbstractBehaviorModel >> hasDependentClassIn: anEnvironment [
	"Answer a boolean indicating whether the receiver has any dependent classes present in the supplied environment.
	For a class this means the superclass is present.
	Traits have no equivalent dependency."

	^ self subclassResponsibility 
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
GtEpReplayAbstractBehaviorModel >> instanceSide [

	^ self subclassResponsibility
]

{ #category : #testing }
GtEpReplayAbstractBehaviorModel >> isClass [ 

	^ self subclassResponsibility 
]

{ #category : #testing }
GtEpReplayAbstractBehaviorModel >> isTrait [

	^ self subclassResponsibility 
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodAt: aSymbol [
	"Answer the method model named aSymbol.
	Raise an exception if it isn't defined by the model"
	^ methods at: aSymbol
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodAt: aSymbol ifAbsent: absentBlock [

	^ methods at: aSymbol ifAbsent: absentBlock
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodAt: aSymbol ifAbsentPut: absentBlock [

	^ methods at: aSymbol ifAbsentPut: absentBlock
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodAt: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [

	^ methods at: aSymbol ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> methodNamed: aSymbol [
	"Answer the method named aSymbol.
	If the method has been defined by the receiver, answer that, otherwise answer the current defition."

	^ methods 
		at: aSymbol
		ifAbsent: [ self currentDefinition methodNamed: aSymbol ]
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
GtEpReplayAbstractBehaviorModel >> name [

	^ self subclassResponsibility
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

{ #category : #accessing }
GtEpReplayAbstractBehaviorModel >> selectors [
	"Answer the selectors defined by the receiver, including the current definition"
	| selectors |

	selectors := methods keys asSet.
	self class environment 
		at: self name
		ifPresent: [ :cls | selectors addAll: cls selectors ].
	^ selectors
]
