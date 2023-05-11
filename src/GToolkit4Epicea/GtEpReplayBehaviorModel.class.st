"
A GtEpReplayBehaviorModel models the state of an individual behaviour, including its methods and their history and the latest comment.
"
Class {
	#name : #GtEpReplayBehaviorModel,
	#superclass : #GtEpReplayAbstractBehaviorModel,
	#instVars : [
		'name',
		'classSide',
		'comments',
		'previousLives',
		'previousNames',
		'imageModel'
	],
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visiting }
GtEpReplayBehaviorModel >> accept: aVisitor [

	aVisitor visitBehaviorReplay: self
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorAddition: anOmEntry [

	self addBehaviorChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorCommentChange: anOmEntry [

	comments add: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorModification: anOmEntry [

	self addBehaviorChange: anOmEntry.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorRemoval: anOmEntry [

	entries add: anOmEntry.
	previousLives add: self copy.
	self reset.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addBehaviorRename: anOmEntry [

	entries add: anOmEntry.
	previousNames add: name.
	name := anOmEntry content newName asSymbol.
]

{ #category : #adding }
GtEpReplayBehaviorModel >> addCategoryChange: anOmEntry [

	entries add: anOmEntry.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> asRingDefinition [

	^ self behaviorAffected asRingDefinition.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> behaviorAffected [
	"Answer the Ring model of the receiver's behavior.
	Either the latest entry, or if none, on the system class"
	<return: #RGClassDefinition>
	
	^ entries
		ifEmpty: [ self isRemoved ifTrue:
				[ previousLives last behaviorAffected ]
			ifFalse:
				[ (self environment at: name) asRingDefinition ] ]
		ifNotEmpty: [ entries last content behaviorAffected ].
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> behaviorAffectedName [

	^ name
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> category [
	"Answer the package of the receiver.
	Epicea incorrectly stores the package name, not the actual (ring) package and doesn't set the category."

	^ self behaviorAffected category ifNil: [ self package name ].
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> classSide [

	^ classSide
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> comment [
	<return: #String>

	^ comments
		ifEmpty: [ entries
			ifEmpty: [ self exists
				ifTrue: [ self currentDefinition comment ]
				ifFalse: [ '' ] ]
			ifNotEmpty: [ entries last content behaviorAffected comment 
				ifNil: [ '' ]
				ifNotNil: [ :rgComment | rgComment content ] ] ]
		ifNotEmpty: [ comments last content newComment ].
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> comments [

	^ comments
]

{ #category : #testing }
GtEpReplayBehaviorModel >> exists [
	"Answer a boolean indicating whether the receiver exists in the modelled system."

	^ self isRemoved not and:
		[ entries isNotEmpty or: 
			[ self environment includesKey: name ] ].
]

{ #category : #ui }
GtEpReplayBehaviorModel >> gtCommentEntriesFor: aView [
	<gtView>

	^ aView forward
		title: 'Comments';
		priority: 20;
		object: [ GtEpiceaEntriesGroup withAll: comments ];
		view: #gtItemsFor:;
		actionUpdateButton
]

{ #category : #ui }
GtEpReplayBehaviorModel >> gtDefinitionFor: aView [
	<gtView>

	^ aView forward
		title: 'Definition';
		priority: 10;
		object: [ self behaviorAffected ];
		view: #gtDefinitionFor:
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> gtPreviousLivesFor: aView [
	<gtView>
	
	^ aView list
		title: 'Previous Lives';
		priority: 40;
		items: [ previousLives ];
		actionUpdateButton
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> gtPreviousNamesFor: aView [
	<gtView>
	
	^ aView list
		title: 'Previous Names';
		priority: 45;
		items: [ previousNames ];
		actionUpdateButton
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> gtViewChangeIcon [
	self isRemoved ifTrue: [
		^ (self environment includesKey: name) 
			ifTrue: [ Smalltalk ui icons iconNamed: #changeRemoveIcon ] 
			ifFalse: [
				Smalltalk ui icons iconNamed: #windowMinimizeInactive ] ].
	
	(self environment includesKey: name) ifTrue: [
		^ Smalltalk ui icons iconNamed: #class ].
	
	^ entries
		detect: [ :entry | entry content isEpClassAddition or: [ entry content isEpClassAddition ] ]
		ifFound: [ :entry | 
			self previousNames
				detect: [ :aName | self environment includesKey: aName asSymbol ]
				ifFound: [ :aName | Smalltalk ui icons iconNamed: #class ]
				ifNone: [ 
					entries
						detect: [ :entry2 | entry2 content isEpClassAddition] 
						ifFound: [ :entry2 | Smalltalk ui icons iconNamed: #changeAddIcon ]
						ifNone: [Smalltalk ui icons iconNamed: #warning]
				 ]. ]
		ifNone: [ (self environment includesKey: name asSymbol)
			ifTrue: [ Smalltalk ui icons iconNamed: #changeAddIcon ]
			ifFalse: [ Smalltalk ui icons iconNamed: #warning ] ].

]

{ #category : #testing }
GtEpReplayBehaviorModel >> hasChanges [

	^ super hasChanges or:
		[ comments isNotEmpty or:
		[ previousLives isNotEmpty ] ]
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> hasCommentEntry [

	^ comments isNotEmpty
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> imageModel [
	<return: #GtEpReplayImageModel>

	^ imageModel
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> imageModel: aGtEpReplayImageModel [

	imageModel := aGtEpReplayImageModel
]

{ #category : #initialization }
GtEpReplayBehaviorModel >> initialize [ 

	super initialize.
	previousLives := OrderedCollection new.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> instanceSide [

	^ self
]

{ #category : #testing }
GtEpReplayBehaviorModel >> isClass [ 

	^ false
]

{ #category : #testing }
GtEpReplayBehaviorModel >> isMeta [

	^ false
]

{ #category : #testing }
GtEpReplayBehaviorModel >> isRemoved [
	"Answer a boolean indicating whether the receiver has been removed from the system."

	^ entries isEmpty and: 
		[ methods isEmpty and:
		[ classSide methods isEmpty and:
		[ previousLives isNotEmpty or:
			[ self currentDefinition isNil ] ] ] ].
]

{ #category : #testing }
GtEpReplayBehaviorModel >> isTrait [

	^ false
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> latestCommentEntry [

	^ comments last
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> name [

	^ name
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> name: aSymbol [

	name := aSymbol asSymbol
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> omEntryFor: anEpCodeChange [

	^ imageModel omEntryFor: anEpCodeChange.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> originalBehaviorNameAffected [
	"Answer the name of the receiver's behavior prior to any renames"

	^ entries
		detect: [ :entry | entry content isEpBehaviorNameChange ]
		ifFound: [ :entry | entry content oldName ]
		ifNone: [ entries last content behaviorAffectedName ].
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> package [
	"Answer the package of the receiver.
	Epicea incorrectly stores the package name, not the actual (ring) package."
	| packageName |

	packageName := self behaviorAffected package.
	^ packageName isString ifTrue:
		[ RGPackageDefinition named: packageName ]
	ifFalse:
		[ packageName ].
]

{ #category : #copying }
GtEpReplayBehaviorModel >> postCopy [

	super postCopy.
	classSide instanceSide: self.
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> previousLives [

	^ previousLives
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> previousNames [
	<return: #Collection of: #Symbol>

	^ previousNames
]

{ #category : #accessing }
GtEpReplayBehaviorModel >> printOn: aStream [

	name ifNil: [ ^ super printOn: aStream ].
	aStream
		<< name;
		<< ' model'.
]

{ #category : #private }
GtEpReplayBehaviorModel >> replayBehaviorRemovalOn: aStream [
	"If the behavior is removed we only need any renames and the final removal."

	entries allButLastDo: [ :replayEntry | 
		replayEntry isEpBehaviorNameChange ifTrue:
			[ aStream nextPut: replayEntry ] ].
	aStream nextPut: entries last.

]

{ #category : #initialization }
GtEpReplayBehaviorModel >> reset [ 

	super reset.
	classSide := GtEpReplayMetaBehaviorModel new instanceSide: self.
	comments := OrderedCollection new.
	previousNames := OrderedCollection new.
]
