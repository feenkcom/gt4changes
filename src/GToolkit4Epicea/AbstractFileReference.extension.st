Extension { #name : #AbstractFileReference }

{ #category : #'*GToolkit4Epicea' }
AbstractFileReference >> gtOmbuFileFor: aView [
	<gtView>

	self extension = 'ombu' ifFalse: [ ^ aView empty ].
	^ aView explicit
		title: 'Entries';
		stencil: [(GtEpiceaChangeListElement forModel: 
			(GtEpiceaChangeListModel onLog: 
				(EpLog fromFile: self)))
			padding: (BlInsets top: 5)].
]
