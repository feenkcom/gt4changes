Class {
	#name : #GtEpBranchUtilities,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpBranchUtilities class >> branchesHeadLogNodesFrom: aCollectionOfEntries [
	"Answer a collection of {{gtClass:GtEpiceaLogViewNode}} from the supplied OmEntries"
	| nodes set |

	nodes := GtEpiceaLogViewNode fromCollection: aCollectionOfEntries.
	set := nodes asSet.
	nodes do: [ :each | set remove: each prior ifAbsent: [] ].
	^ set sorted: [ :each | each entry gtTime ] descending.
]
