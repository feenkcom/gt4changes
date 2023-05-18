Class {
	#name : #BaselineOfGToolkit4Changes,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfGToolkit4Changes
}

{ #category : #baseline }
BaselineOfGToolkit4Changes >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoadChanges:'.
		spec
			baseline: 'Brick' with: [
				spec repository: 'github://feenkcom/Brick:v0.8.950/src' ].

		spec package: 'GToolkit4Epicea' with: [
			spec requires: #('Brick') ].
	]
]

{ #category : #accessing }
BaselineOfGToolkit4Changes >> postLoadChanges: spec [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].
		
	PostLoaded := true.
	self postLoadEpiceaChanges: spec
]

{ #category : #accessing }
BaselineOfGToolkit4Changes >> postLoadEpiceaChanges: spec [ 
 	(self class environment 
 		at: #EpBehaviorCategoryChange 
 		ifPresent: [ :aClass |
 			self class environment
 				at: #TGtEpBehaviorCategoryChangeOldPackageName 
 				ifPresent: [ :aTrait |
 					aClass addToComposition: aTrait ] ]).
 	(self class environment 
 		at: #EpMethodModification 
 		ifPresent: [ :aClass |
 			self class environment
 				at: #TGtEpMethodModificationClassPackagename 
 				ifPresent: [ :aTrait |
 					aClass addToComposition: aTrait ] ]).
]
