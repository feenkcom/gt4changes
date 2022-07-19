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
	#category : #'GToolkit4Epicea-View Model'
}

{ #category : #'instance creation' }
GtEpiceaChangeListModel class >> onLog: anEpLog [
	^ self new log: anEpLog
]

{ #category : #accessing }
GtEpiceaChangeListModel >> allStream [
	^ AsyncSequenceStream forCollection: all
]

{ #category : #accessing }
GtEpiceaChangeListModel >> applyFiltersFrom: aFilterElement [
	| items |
	items := self allStream.
	aFilterElement
		filtersDo: [ :descriptor :ignored | items := descriptor newFilterWithValue: items ].
	items := items toArray wait.
	available := items.
	selection := items asOrderedCollection.
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
GtEpiceaChangeListModel >> filterDescriptors [
	^ (GtPhlowCollector new
		fromObject: self log;
		pragmaName: #gtChangeFilter;
		collectAllPragmas)
		collect: [ :aPragma | self log perform: aPragma methodSelector ]
]

{ #category : #accessing }
GtEpiceaChangeListModel >> initialize [
	all := OrderedCollection new.
	selection := OrderedCollection new.
	available := OrderedCollection new
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
