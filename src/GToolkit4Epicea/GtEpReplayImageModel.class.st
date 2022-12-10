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
GtEpReplayImageModel >> addBehaviorAddition: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorChange: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorCommentChange: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorCommentChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorModification: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addBehaviorModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorRemoval: anOmEntry [
	| behavior entry |

	entry := anOmEntry content.
	behavior := self classOrTraitNamed: entry behaviorAffectedName.
	behavior addBehaviorRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addBehaviorRename: anOmEntry [
	| behavior entry |

	entry := anOmEntry content.
	behavior := self classOrTraitNamed: entry oldName.
	behavior addBehaviorRename: anOmEntry.
	behaviors 
		removeKey: entry oldName
		ifAbsent: [ ].
	behaviors at: entry newName put: behavior.
]

{ #category : #adding }
GtEpReplayImageModel >> addCategoryChange: anOmEntry [
	"We're a bit lazy at the moment.
	Assume subsequent behavior changes will take care of everything."
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodAddition: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addMethodAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodChange: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addMethodChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodModification: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addMethodModification: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addMethodRemoval: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addMethodRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolAddition: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addProtocolAddition: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addProtocolRemoval: anOmEntry [
	| behavior |

	behavior := self classOrTraitNamed: anOmEntry content behaviorAffectedName.
	behavior addProtocolRemoval: anOmEntry.
]

{ #category : #adding }
GtEpReplayImageModel >> addTraitRemoval: anOmEntry [
	| behavior entry |

	entry := anOmEntry content.
	behavior := self classOrTraitNamed: entry behaviorAffectedName.
	behavior addTraitRemoval: anOmEntry.
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
GtEpReplayImageModel >> behaviorAt: aSymbol ifPresent: presentBlock ifAbsent: absentBlock [
	"Answer the behavior model for the given name"

	^ behaviors 
		at: aSymbol 
		ifPresent: presentBlock
		ifAbsent: absentBlock .

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

	behavior := behaviors at: baseName ifAbsentPut: 
		[ GtEpReplayBehaviorModel new
			name: baseName ].
	^ meta 
		ifTrue: [ behavior classSide ]
		ifFalse: [ behavior ]
]

{ #category : #accessing }
GtEpReplayImageModel >> environment [

	^ self class environment
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
