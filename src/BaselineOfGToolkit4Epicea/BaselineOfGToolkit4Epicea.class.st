Class {
	#name : #BaselineOfGToolkit4Epicea,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4Epicea
}

{ #category : #baseline }
BaselineOfGToolkit4Epicea >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Brick'
			with: [ spec repository: 'github://feenkcom/Brick:main/src' ].
		spec package: 'GToolkit4Epica' with: [ spec requires: #( 'Brick' ) ] ]
]
