Class {
	#name : #GtEpiceaAction,
	#superclass : #Object,
	#instVars : [
		'events'
	],
	#category : #'GToolkit4Epicea-GToolkit4Epicea'
}

{ #category : #'instance creation' }
GtEpiceaAction class >> on: aCollectionOfEvents [

	^ self new events: aCollectionOfEvents
]

{ #category : #accessing }
GtEpiceaAction >> action [
	events do: [:each | each applyCodeChange ]
]

{ #category : #accessing }
GtEpiceaAction >> events [
	^ events
]

{ #category : #accessing }
GtEpiceaAction >> events: aCollectionOfEvents [ 
	events := self treatEvents: (self latestEventsFrom: aCollectionOfEvents reversed).
]

{ #category : #accessing }
GtEpiceaAction >> gtEventsFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Selected Changes';
		  priority: 3;
		  itemsProvider: [ self events asBrItemsProvider ];
		  column: 'Icon' icon: [ :anEpEvent :anIndex | 
			  (anEpEvent accept: EpIconVisitor new) asElement ]
		  width: 32;
		  column: 'Description' stencil: [ :anEpEvent :anIndex | 
			  BlElement new
				  layout: BlLinearLayout horizontal;
				  addChildren:
					  (anEpEvent accept: GtEpiceaBrickVisitor new);
				  constraintsDo: [ :c | 
					  c horizontal fitContent.
					  c vertical fitContent ] ];
		 actionButtonLabel: 'Confirm'
		 tooltip: 'Confirm action'
		 action: [ self action ]
]

{ #category : #accessing }
GtEpiceaAction >> latestEventsFrom: previewEventsTheOldestFirst [
	
	| aLog filter logBrowserModel |
	aLog := EpLog newWithStore: (OmMemoryStore withAllContents: previewEventsTheOldestFirst).
	logBrowserModel := EpLogBrowserPresenter newWithLog: aLog.
	filter := EpLatestCodeChangeFilter new
		logBrowserModel: logBrowserModel;
		yourself.
	^ aLog entries 
		select: [ :each | filter accepts: each ] 
		thenCollect: [ :each | each content ]
]

{ #category : #accessing }
GtEpiceaAction >> treatEvents: aCollectionOfEvents [
	^ self subclassResponsibility
]
