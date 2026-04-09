"
A GtEpReplayImageModel holds a model of a collection of Epicea events.
"
Class {
	#name : #GtEpReplayImageModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'behaviors',
		'nextOmEntryLocalName'
	],
	#category : 'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayImageModel >> accept: aVisitor [

	aVisitor visitImageReplay: self
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorCategoryChange: anOmEntry [
	| behavior event |

	event := anOmEntry content.
	behavior := self classOrTraitNamed: event behaviorAffectedName
		ifAbsentPut: [ :baseName | (self behaviorModelFor: event) name: baseName ].

	behavior addCategoryChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorCommentChange: anOmEntry [
	| behavior event |

	event := anOmEntry content.
	behavior := self classOrTraitNamed: event behaviorAffectedName
		ifAbsentPut: [ :baseName | (self behaviorModelFor: event) name: baseName ].

	behavior addBehaviorCommentChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorRename: anOmEntry [
	| oldBehavior newBehavior event |

	event := anOmEntry content.
	oldBehavior := self classOrTraitNamed: event oldName
		ifAbsentPut: [ :baseName | 
			(self behaviorModelFor: event) name: baseName ].
	oldBehavior addBehaviorRename: anOmEntry.
	behaviors 
		removeKey: event oldName
		ifAbsent: [ ].
	newBehavior := self classOrTraitNamed: event newName
		ifPresent: [ :behavior |
			behavior isRemoved ifFalse:
				[ behavior addBehaviorRemoval: anOmEntry ].
			oldBehavior previousLives addAll: behavior previousLives. ].
	behaviors at: event newName put: oldBehavior.
]

{ #category : #'as yet unclassified' }
GtEpReplayImageModel >> addBehaviorRepackagedChange: anOmEntry [
	| behavior event |

	event := anOmEntry content.
	behavior := self classOrTraitNamed: event behaviorAffectedName
		ifAbsentPut: [ :baseName | (self behaviorModelFor: event) name: baseName ].

	behavior addBehaviorRepackagedChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addCategoryChange: anOmEntry [

	self addOtherChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassAddition: anOmEntry [

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addBehaviorAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassModification: anOmEntry [

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addBehaviorModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassRemoval: anOmEntry [

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addBehaviorRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodAddition: anOmEntry [
	"Add the supplied method definition.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodChange: anOmEntry [
	"Add the supplied method change.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addMethodChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodModification: anOmEntry [
	"Add the supplied method definition.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodRemoval: anOmEntry [
	"Add the supplied method removal.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addMethodRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addOtherChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolAddition: anOmEntry [

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addProtocolAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolRemoval: anOmEntry [

	^ (self classModelNamed: anOmEntry content behaviorAffectedName) addProtocolRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addTraitAddition: anOmEntry [
	| behavior |

	behavior := self traitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addTraitModification: anOmEntry [
	| behavior |

	behavior := self traitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addTraitRemoval: anOmEntry [
	| behavior |

	behavior := self traitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorRemoval: anOmEntry.
]

{ #category : #accessing }
GtEpReplayImageModel >> behaviorAt: aSymbol [
	"Answer the behavior model for the given name"

	^ behaviors 
		at: aSymbol 
		ifPresent: [ :behavior | behavior ]
		ifAbsent: [ KeyNotFound signalFor: aSymbol ].

]

{ #category : #accessing }
GtEpReplayImageModel >> behaviorAt: aSymbol ifAbsent: absentBlock [
	"Answer the behavior model for the given name"

	^ behaviors 
		at: aSymbol 
		ifAbsent: absentBlock.
]

{ #category : #accessing }
GtEpReplayImageModel >> behaviorAt: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the behavior model for the given name"

	^ behaviors 
		at: aSymbol 
		ifPresent: presentBlock
		ifAbsent: absentBlock .

]

{ #category : #private }
GtEpReplayImageModel >> behaviorModelFor: anEpEvent [
	"Answer the appropriate behavior model for the supplied event"
	| behaviorModel |

	behaviorModel := anEpEvent behaviorAffected isClass ifTrue:
			[ GtEpReplayClassModel new ]
		ifFalse: [ anEpEvent behaviorAffected isTrait ifTrue:
			[ GtEpReplayTraitModel new ]
		ifFalse:
			[ self error: 'Unknown behavior' ] ].
	behaviorModel imageModel: self.
	^ behaviorModel.
]

{ #category : #private }
GtEpReplayImageModel >> behaviorModelForBehavior: aBehavior [
	"Answer the appropriate behavior model for the supplied behavior"
	| behaviorModel |

	behaviorModel := aBehavior isClass ifTrue:
			[ GtEpReplayClassModel new ]
		ifFalse: [ aBehavior isTrait ifTrue:
			[ GtEpReplayTraitModel new ]
		ifFalse:
			[ self error: 'Unknown behavior' ] ].
	behaviorModel imageModel: self.
	^ behaviorModel.
]

{ #category : #private }
GtEpReplayImageModel >> behaviorModelNamed: aSymbol [
	"Answer the appropriate behavior model for the supplied name.  If the behavior exists, use its type, otherwise assume Class"
self halt: 'image access'.
	^ (self class environment
		at: aSymbol
		ifPresent: [ :behavior | self behaviorModelForBehavior: behavior ]
		ifAbsent: [ GtEpReplayClassModel new ])
			imageModel: self;
			name: aSymbol
]

{ #category : #accessing }
GtEpReplayImageModel >> behaviors [

	^ behaviors
]

{ #category : #private }
GtEpReplayImageModel >> classModelNamed: aSymbol [

	^ self classOrTraitNamed: aSymbol
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new 
			imageModel: self;
			name: baseName ].
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol [
	"Answer the class or trait with the supplied name, or nil if not found"
	| nameAndMeta behavior |

	nameAndMeta := self class classNameAndMeta: aSymbol.
	behavior := behaviors at: nameAndMeta first ifAbsent: [ ^ nil ].
	^ nameAndMeta second
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifAbsent: absentBlock [
	"Answer the class or trait with the supplied name"
	| nameAndMeta behavior |

	nameAndMeta := self class classNameAndMeta: aSymbol.
	behavior := behaviors at: nameAndMeta first 
		ifAbsent: [ absentBlock value: nameAndMeta first ].
	 ^ nameAndMeta second 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifAbsentPut: putBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| nameAndMeta behavior |

	nameAndMeta := self class classNameAndMeta: aSymbol.
	behavior := behaviors at: nameAndMeta first 
		ifAbsentPut: [ putBlock value: nameAndMeta first ].
	 ^ nameAndMeta second 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifPresent: presentBlock [

	^ self classOrTraitNamed: aSymbol
		ifPresent: presentBlock
		ifAbsent: [ :basename | ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| nameAndMeta behavior |

	nameAndMeta := self class classNameAndMeta: aSymbol.
	behavior := behaviors at: nameAndMeta first 
		ifAbsent: [ ^ absentBlock cull: nameAndMeta first ].
	 ^ presentBlock value: (nameAndMeta second 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ])
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitSometimeNamed: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	"Search for the model that is either currently or was previously named aSymbol"
	| nameAndMeta basename behavior |

	nameAndMeta := self class classNameAndMeta: aSymbol.
	basename := nameAndMeta first.
	behavior := behaviors at: basename ifAbsent: 
		[ behaviors
			detect: [ :aBehavior | aBehavior previousNames includes: basename ]
			ifFound: [ :aBehavior | aBehavior ]
			ifNone: [ ^ absentBlock cull: basename ] ].
	^ presentBlock value: (nameAndMeta second 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ])
]

{ #category : #ui }
GtEpReplayImageModel >> gtBehaviorsFor: aView [
	<gtView>

	^ aView list
		title: 'Behaviors';
		priority: 10;
		items: [ behaviors associations sorted: #key ascending ];
		itemText: [ :item | item key ];
		send: [ :item | item value ];
		actionUpdateButton.
]

{ #category : #ui }
GtEpReplayImageModel >> gtBehaviorsTreeFor: aView [
	<gtView>

	^ aView columnedTree
		title: 'Behaviors (tree)';
		priority: 5;
		items: [ behaviors values sorted: #name ascending ];
		children: [ :anEntry |
			anEntry gtViewChangeHistoryChildren ];
		column: 'Details' do: [ :aColumn | 
			aColumn 
				cellStencil: [ GtEpiceaHistoryEntityDetailsElement new ];
				dataBinder: [ :anElement :anEntry | anElement updateForEntry: anEntry ] ];
		column: 'Timestamp' text: [ :anEntry | 
			anEntry gtViewLatestChangeTime 
				ifNil: [ '' ]
				ifNotNil: [ :aTimestamp | aTimestamp printToSeconds ] ] width: 150;
		actionUpdateButton.
]

{ #category : #testing }
GtEpReplayImageModel >> hasChanges [

	^ super hasChanges or:
		[ behaviors isNotEmpty ].
]

{ #category : #testing }
GtEpReplayImageModel >> includesBehaviorSometimeNamed: aSymbol [
	"Answer a boolean indicating whether the named behaviour exists in the list of behaviours with its current or a previous name, without looking at superclasses"
	| basenameAndMeta basename |

	basenameAndMeta := self class classNameAndMeta: aSymbol.
	basename := basenameAndMeta first.
	^ behaviors
		at: basename
		ifPresent: [ :aBehavior | true ]
		ifAbsent: [ behaviors 
			detect: [ :aBehavior | 
				aBehavior isDefined and:
					[ aBehavior previousNames includes: basename ] ]
			ifFound: [ :aBehavior | true ]
			ifNone: [ false ] ].
]

{ #category : #initialization }
GtEpReplayImageModel >> initialize [ 

	super initialize.
	behaviors := Dictionary new.
	nextOmEntryLocalName := 1.
]

{ #category : #accessing }
GtEpReplayImageModel >> omEntryFor: anEpCodeChange [
	| entry |
	
	entry := OmEntry content: anEpCodeChange.
	entry tags
		at: #time put: DateAndTime now;
		at: #self put: (OmReference
			globalName: 'GtEpReplayImageModel'
			localName: nextOmEntryLocalName asString).
	nextOmEntryLocalName := nextOmEntryLocalName + 1.
	^ entry
]

{ #category : #accessing }
GtEpReplayImageModel >> packages [
	"Answer the packages defined by the receiver."

	^ behaviors values collect: #package.
]

{ #category : #accessing }
GtEpReplayImageModel >> subclassesFor: aBehaviorModel [
	| behaviorName |

	behaviorName := aBehaviorModel name.
	^ behaviors values select: [ :each | 
		each isClass and: [ 
		each isRemoved not and: [
		each superclassName = behaviorName ] ] ]
]

{ #category : #private }
GtEpReplayImageModel >> traitNamed: aSymbol [
	"Answer the trait named aSymbol.
	If the model was created through a method change it will be incorrectly modelled as a class, convert to a trait."
	| behavior |

	behavior := self classOrTraitNamed: aSymbol ifAbsentPut: 
		[ :baseName | GtEpReplayTraitModel new 
			imageModel: self;
			name: baseName ].
	behavior isClass ifTrue:
		[ behavior := GtEpReplayTraitModel fromClassModel: behavior.
		behaviors at: aSymbol put: behavior. ].
	^ behavior.
]
