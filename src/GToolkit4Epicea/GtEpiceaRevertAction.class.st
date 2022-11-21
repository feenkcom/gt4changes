Class {
	#name : #GtEpiceaRevertAction,
	#superclass : #GtEpiceaAction,
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #accessing }
GtEpiceaRevertAction >> eventsFromEntries: aCollectionOfEntries [
	events := ((self
			latestEventsFrom: (aCollectionOfEntries
					collect: [ :each | each copy content: each content asRevertedCodeChange ]))
			flatCollect: [ :each | each previewedApplyEvents ])
			select: [ :eachEvent | eachEvent accept: (EpHasImpactVisitor inEnvironment: self class environment) ]
]
