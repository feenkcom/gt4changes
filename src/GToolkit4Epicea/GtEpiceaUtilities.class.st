Class {
	#name : #GtEpiceaUtilities,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpiceaUtilities class >> branchesHeadLogNodesFrom: aCollectionOfEntries [
	"Answer a collection of {{gtClass:GtEpiceaLogViewNode}} which are the head nodes of each branch from the supplied OmEntries"
	| nodes set |

	nodes := GtEpiceaLogViewNode fromCollection: aCollectionOfEntries.
	set := nodes asSet.
	nodes do: [ :each | set remove: each prior ifAbsent: [] ].
	^ set sorted: (self omEntrySortFunctionFor: #entry) reversed.
]

{ #category : #accessing }
GtEpiceaUtilities class >> omEntrySortFunctionFor: aBlock [
	"Answer a function that sorts OmEntries by time and localName.
	aBlock takes a single argument and answers the associated OmEntry.
	Sorting by time alone is insufficient since two entries may have the same time.
	This function assumes that a collection of ombu files never overlap in time."

	^ GtOmEntrySortFunction new accessorBlock: aBlock.
]
