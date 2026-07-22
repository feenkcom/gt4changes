Class {
	#name : #GtEpiceaPackageHistoriesGroup,
	#superclass : #GtEpiceaEntityHistoriesGroup,
	#category : 'GToolkit4Epicea-History'
}

{ #category : #accessing }
GtEpiceaPackageHistoriesGroup >> historyForPackageNamed: aPackageName [
	^ self detect: [ :aPackageHistory | 
		aPackageHistory targetPackageName = aPackageName ]
]
