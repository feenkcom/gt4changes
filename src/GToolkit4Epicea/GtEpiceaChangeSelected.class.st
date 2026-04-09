Class {
	#name : #GtEpiceaChangeSelected,
	#superclass : #Announcement,
	#instVars : [
		'change'
	],
	#category : #'GToolkit4Epicea-Announcements'
}

{ #category : #accessing }
GtEpiceaChangeSelected >> change [
	^ change
]

{ #category : #accessing }
GtEpiceaChangeSelected >> change: aChange [
	change := aChange
]
