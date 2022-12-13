Class {
	#name : #GtEpiceaEntriesGroup,
	#superclass : #Object,
	#traits : 'TGtGroup + TGtGroupItems',
	#classTraits : 'TGtGroup classTrait + TGtGroupItems classTrait',
	#category : #'GToolkit4Epicea-Model'
}

{ #category : #'accessing - filtering' }
GtEpiceaEntriesGroup >> behaviorChanges [
	^ self select: [ :anOmbuEntry |
		anOmbuEntry content isEpBehaviorChange ]
]

{ #category : #'accessing - grouping' }
GtEpiceaEntriesGroup >> behaviorChangesGroupedByClass [
	^ self behaviorChanges 
		groupedBy: [ :anOmbuEntry | 
			anOmbuEntry content behaviorAffected instanceSide ]
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> changesGroupedByBranch [
	| headNodes |

	headNodes := GtEpBranchUtilities branchesHeadLogNodesFrom: self items.
	^ headNodes collect: [ :node | node entry -> node entries ].
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> classHistories [
	^ GtEpiceaClassesHistoryBuilder 
		buildHistoryForEntriesGroup: self
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> gtItemsFor: aView [ 
	<gtView>
	
	^ aView columnedList 
		title: 'Entries List';
		priority: 5;
		items: [ self ];
		column: 'Icon'
			icon: [ :anOmbuEntry | 
				anOmbuEntry content accept: EpIconVisitor new ]
			width: 32;
		column: 'Method' do: [ :aColumn |
			aColumn 
				cellStencil: [ BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c | 
						c horizontal fitContent.
						c vertical exact: 26 ] ];
				dataBinder: [ :anElement :anOmbuEntity | 
					anElement
						removeChildren;
						addChildren: (anOmbuEntity content 
							accept: GtEpiceaBrickVisitor new) ] ]; 
		column: 'Timestamp'
			text: [ :anOmbuEntry | anOmbuEntry gtTime printToSeconds ]
			width: 150
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> initialChange [
	^ self items detectMin: [ :anOmbuEntry | anOmbuEntry gtTime]
]

{ #category : #accessing }
GtEpiceaEntriesGroup >> latestChange [
	^ self items detectMax: [ :anOmbuEntry | anOmbuEntry gtTime]
]

{ #category : #'accessing - filtering' }
GtEpiceaEntriesGroup >> methodChanges [
	^ self select: [ :anOmbuEntry |
		anOmbuEntry content isEpMethodChange ]
]

{ #category : #'accessing - grouping' }
GtEpiceaEntriesGroup >> methodChangesGroupedByAffectedMethod [
	^ self methodChanges
		groupedBy: [ :anOmbuEntry | 
			anOmbuEntry content methodAffected ]
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> methodHistories [
	^ GtEpiceaMethodsHistoryBuilder
		buildHistoryForEntriesGroup: self
]

{ #category : #'accessing - history' }
GtEpiceaEntriesGroup >> packageHistories [
	^ GtEpiceaPackagesHistoryBuilder 
		buildHistoryForEntriesGroup: self
]
