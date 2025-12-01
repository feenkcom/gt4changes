Trait {
	#name : #TGtEpMethodModificationClassPackagename,
	#instVars : [
		'classPackageName'
	],
	#category : 'GToolkit4Epicea-Model'
}

{ #category : #accessing }
TGtEpMethodModificationClassPackagename >> classPackageName [
	^ classPackageName
]

{ #category : #accessing }
TGtEpMethodModificationClassPackagename >> updateClassPackageName [
	self newMethod realParent 
		ifNotNil: [ :aParent |
			classPackageName := aParent package name ]
]
