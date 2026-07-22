Class {
	#name : #GtEpiceaChangeListModel,
	#superclass : #Object,
	#instVars : [
		'log',
		'promise',
		'selection',
		'whenReadyBlock',
		'available',
		'all'
	],
	#category : 'GToolkit4Epicea-View Model'
}

{ #category : #'instance creation' }
GtEpiceaChangeListModel class >> onEvents: aCollection [
	^ self new events: aCollection
]

{ #category : #'instance creation' }
GtEpiceaChangeListModel class >> onLog: anEpLog [
	^ self new log: anEpLog
]

{ #category : #accessing }
GtEpiceaChangeListModel >> allEvents [
	^ all
]

{ #category : #accessing }
GtEpiceaChangeListModel >> allStream [
	^ AsyncSequenceStream forCollection: all
]

{ #category : #accessing }
GtEpiceaChangeListModel >> applyFiltersFrom: aFilterElement [
	"this is a hack and should use real filters instead"
	| items |
	items := self allStream.
	aFilterElement
		filtersDo: [ :descriptor :value | items := descriptor creationBlock cull: items cull: value ].
	items := items toArray wait.
	available := items.
	selection := items asOrderedCollection.
]

{ #category : #accessing }
GtEpiceaChangeListModel >> availableEvents [
	^ available
]

{ #category : #accessing }
GtEpiceaChangeListModel >> availableProvider [
	^ BrStreamItemsProvider forCollection: available
]

{ #category : #accessing }
GtEpiceaChangeListModel >> deselect: anEpEvent [
	selection remove: anEpEvent
]

{ #category : #accessing }
GtEpiceaChangeListModel >> events: aCollection [
	available := aCollection.
	all := available.
	selection := available.
	self whenReadyBlock ifNotNil: [ self whenReadyBlock value ]
]

{ #category : #accessing }
GtEpiceaChangeListModel >> filterDescriptors [
	^ ((GtPhlowCollector new
		fromObject: self log;
		pragmaName: #gtChangeFilter;
		collectAllPragmas)
		collect: [ :aPragma | self log perform: aPragma methodSelector ])
		sorted: [ :aFilterDescriptor |
			aFilterDescriptor order ] ascending
]

{ #category : #accessing }
GtEpiceaChangeListModel >> initialize [
	super initialize.
	
	all := OrderedCollection new.
	selection := OrderedCollection new.
	available := OrderedCollection new
]

{ #category : #accessing }
GtEpiceaChangeListModel >> isSelected: anEpEvent [
	^ selection includes: anEpEvent
]

{ #category : #accessing }
GtEpiceaChangeListModel >> log [
	^ log
]

{ #category : #accessing }
GtEpiceaChangeListModel >> log: anEpLog [
	log := anEpLog.
	promise := anEpLog entriesStream toArray
			then: [ :aValue | 
				promise := nil.
				available := aValue reversed.
				all := available.
				selection := available asOrderedCollection.
				self whenReadyBlock ifNotNil: [ self whenReadyBlock value ] ].
	promise await
]

{ #category : #accessing }
GtEpiceaChangeListModel >> rawLog: anEpLog [
	log := anEpLog
]

{ #category : #accessing }
GtEpiceaChangeListModel >> select: anEpEvent [
	selection add: anEpEvent
]

{ #category : #accessing }
GtEpiceaChangeListModel >> selectedCodeEvents [
	^ selection select: [ :event | event content isCodeChange ]
]

{ #category : #accessing }
GtEpiceaChangeListModel >> setSelection: aCollectionOfEpEvents [
	selection := aCollectionOfEpEvents
]

{ #category : #accessing }
GtEpiceaChangeListModel >> timeAt: anEvent [
	^ self log timeAt: anEvent
]

{ #category : #accessing }
GtEpiceaChangeListModel >> whenReady: aBlock [
	"promise is already fulfilled"
	promise
		ifNil: [ aBlock value.
			^ self ].

	"otherwise mark for later"
	whenReadyBlock := aBlock
]

{ #category : #accessing }
GtEpiceaChangeListModel >> whenReadyBlock [
	^ whenReadyBlock
]
