Class {
	#name : #GtEpBranchUtilities,
	#superclass : #Object,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #accessing }
GtEpBranchUtilities class >> branchesHeadLogNodesFrom: aCollectionOfEntries [
	"Answer a collection of {{gtClass:GtEpiceaLogViewNode}} from the supplied OmEntries"
	| nodes |

	nodes := GtEpiceaLogViewNode fromCollection: aCollectionOfEntries.
	^ nodes select: [ :each | each prior isNil ].
]
