Class {
	#name : #GtOmEntrySortFunction,
	#superclass : #SortFunction,
	#instVars : [
		'accessorBlock'
	],
	#category : #'GToolkit4Epicea-Tools'
}

{ #category : #accessing }
GtOmEntrySortFunction >> accessorBlock [
	^ accessorBlock
]

{ #category : #accessing }
GtOmEntrySortFunction >> accessorBlock: aBlock [
	accessorBlock := aBlock
]

{ #category : #accessing }
GtOmEntrySortFunction >> collate: object1 with: object2 [
	"Do a three-way comparison between the anObject1 and anObject2, returning
	-1 if anObject1 < anObject2
	0 if anObject1 = anObject2
	1 if anObject1 > anObject2
	This assumes a total order in accordance with the mathematical law of trichotomy.
	See also:  http://en.wikipedia.org/wiki/Three-way_comparison"
	| omEntry1 omEntry2 time1 time2 localName1 localName2 |

	omEntry1 := accessorBlock ifNil: [ object1 ] ifNotNil: [ accessorBlock value: object1 ].
	omEntry2 := accessorBlock ifNil: [ object2 ] ifNotNil: [ accessorBlock value: object2 ].

	time1 := omEntry1 gtTime.
	time2 := omEntry2 gtTime.

	^ time1 = time2 ifTrue: 
		[ localName1 := (omEntry1 tagAt: #self) localName asNumber.
		localName2 := (omEntry2 tagAt: #self) localName asNumber.
		localName1 = localName2
			ifTrue: [ 0 ]
			ifFalse: [ localName1 < localName2 ifTrue: [ -1 ] ifFalse: [ 1 ] ] ]
	ifFalse: 
		[ time1 < time2 ifTrue: [ -1 ] ifFalse: [ 1 ] ].
]
