"
A GtEpReplayImageModel models the state of the image code base using the current image as the starting state.
"
Class {
	#name : #GtEpReplayImageModel,
	#superclass : #GtEpReplayModel,
	#instVars : [
		'behaviors'
	],
	#category : #'GToolkit4Epicea-Sequencer'
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
	| behavior event |

	event := anOmEntry content.
	behavior := self classOrTraitNamed: event oldName
		ifAbsentPut: [ :baseName | (self behaviorModelFor: event) name: baseName ].
	behavior addBehaviorRename: anOmEntry.
	behaviors 
		removeKey: event oldName
		ifAbsent: [ ].
	behaviors at: event newName put: behavior.
]

{ #category : #adding }
GtEpReplayImageModel >> addCategoryChange: anOmEntry [

	self addOtherChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassAddition: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addBehaviorAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassModification: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addBehaviorModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addClassRemoval: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addBehaviorRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodAddition: anOmEntry [
	"Add the supplied method definition.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodChange: anOmEntry [
	"Add the supplied method change.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addMethodChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodModification: anOmEntry [
	"Add the supplied method definition.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodRemoval: anOmEntry [
	"Add the supplied method removal.
	Ring doesn't model whether the method is being added to a class or a trait, so if the behavior definition is missing we have to assume it is a class.  If this turns out to be wrong, it will be converted to a Trait when the definition is supplied."
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addMethodRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addOtherChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolAddition: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addProtocolAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolRemoval: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName
		ifAbsentPut: [ :baseName | GtEpReplayClassModel new name: baseName ].
	behavior addProtocolRemoval: anOmEntry.
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

	^ anEpEvent behaviorAffected isClass ifTrue:
		[ GtEpReplayClassModel new ]
	ifFalse: [ anEpEvent behaviorAffected isTrait ifTrue:
		[ GtEpReplayTraitModel new ]
	ifFalse:
		[ self error: 'Unknown behavior' ] ]
]

{ #category : #private }
GtEpReplayImageModel >> behaviorModelForBehavior: aBehavior [
	"Answer the appropriate behavior model for the supplied behavior"

	^ aBehavior isClass ifTrue:
		[ GtEpReplayClassModel new ]
	ifFalse: [ aBehavior isTrait ifTrue:
		[ GtEpReplayTraitModel new ]
	ifFalse:
		[ self error: 'Unknown behavior' ] ]
]

{ #category : #private }
GtEpReplayImageModel >> behaviorModelForName: aSymbol [
	"Answer the appropriate behavior model for the supplied behavior"

	^ self behaviorModelForBehavior: (self class environment at: aSymbol)
]

{ #category : #accessing }
GtEpReplayImageModel >> behaviors [

	^ behaviors
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| meta baseName behavior |

	(aSymbol endsWith: ' class') ifTrue: 
		[ meta := true.
		baseName := (aSymbol copyFrom: 1 to: aSymbol size - 6) asSymbol ]
	ifFalse: 
		[ (aSymbol endsWith: ' classTrait') ifTrue: 
			[ meta := true.
			baseName := (aSymbol copyFrom: 1 to: aSymbol size - 11) asSymbol ]
		ifFalse: 
			[ meta := false.
			baseName := aSymbol asSymbol ] ].

	behavior := behaviors at: baseName "ifAbsentPut: 
		[ GtEpReplayBehaviorModel new
			name: baseName ]".
	 ^ meta 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifAbsent: absentBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| meta baseName behavior |

	(aSymbol endsWith: ' class') ifTrue: 
		[ meta := true.
		baseName := (aSymbol copyFrom: 1 to: aSymbol size - 6) asSymbol ]
	ifFalse: 
		[ (aSymbol endsWith: ' classTrait') ifTrue: 
			[ meta := true.
			baseName := (aSymbol copyFrom: 1 to: aSymbol size - 11) asSymbol ]
		ifFalse: 
			[ meta := false.
			baseName := aSymbol asSymbol ] ].

	behavior := behaviors at: baseName 
		ifAbsent: [ absentBlock value: baseName ].
	 ^ meta 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> classOrTraitNamed: aSymbol ifAbsentPut: putBlock [
	"Answer the class or trait with the supplied name.
	If it is present in the running image, but not the model, add it to the model.
	Otherwise answer nil."
	| meta baseName behavior |

	(aSymbol endsWith: ' class') ifTrue: 
		[ meta := true.
		baseName := (aSymbol copyFrom: 1 to: aSymbol size - 6) asSymbol ]
	ifFalse: 
		[ (aSymbol endsWith: ' classTrait') ifTrue: 
			[ meta := true.
			baseName := (aSymbol copyFrom: 1 to: aSymbol size - 11) asSymbol ]
		ifFalse: 
			[ meta := false.
			baseName := aSymbol asSymbol ] ].

	behavior := behaviors at: baseName 
		ifAbsentPut: [ putBlock value: baseName ].
	 ^ meta 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
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

{ #category : #testing }
GtEpReplayImageModel >> includesBehaviorNamed: aSymbol [
	"Answer a boolean indicating whether the named behaviour exists in the system at the current point in replay"

	^ (behaviors includesKey: aSymbol) or:
		[ self environment includesKey: aSymbol ]
]

{ #category : #initialization }
GtEpReplayImageModel >> initialize [ 

	super initialize.
	behaviors := Dictionary new.

]

{ #category : #accessing }
GtEpReplayImageModel >> packages [
	"Answer the packages defined by the receiver."

	^ behaviors values collect: #package.
]

{ #category : #private }
GtEpReplayImageModel >> traitNamed: aSymbol [
	"Answer the trait named aSymbol.
	If the model was created through a method change it will be incorrectly modelled as a class, convert to a trait."
	| behavior |

	behavior := self classOrTraitNamed: aSymbol ifAbsentPut: 
		[ :baseName | GtEpReplayTraitModel new name: baseName ].
	behavior isClass ifTrue:
		[ behavior := GtEpReplayTraitModel fromClassModel: behavior ].
	^ behavior.
]
