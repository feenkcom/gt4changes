Class {
	#name : #GtExportedEventApplyVisitor,
	#superclass : #EpApplyVisitor,
	#category : #'GToolkit4Epicea-Sequencer'
}

{ #category : #visitor }
GtExportedEventApplyVisitor >> visitBehaviorNameChange: aClassRenameChange [
	(environment classOrTraitNamed: aClassRenameChange oldName)
		ifNotNil: [ :cls | cls rename: aClassRenameChange newName ]
]

{ #category : #visitor }
GtExportedEventApplyVisitor >> visitClassRemoval: aClassRemoval [
	(environment classOrTraitNamed: aClassRemoval behaviorAffectedName)
		ifNotNil: [ :cls | environment removeClassNamed: aClassRemoval behaviorAffectedName ]
]

{ #category : #visitor }
GtExportedEventApplyVisitor >> visitExpressionEvaluation: anExpressionChange [

	self class compiler evaluate: anExpressionChange expression
]

{ #category : #'as yet unclassified' }
GtExportedEventApplyVisitor >> visitMethodUpdateNoSource: aMethodModified [

	self
		behaviorNamed: aMethodModified behaviorAffectedName
		ifPresent: [ :behavior |
			| selector |
			selector := behavior
				compile: aMethodModified sourceCode
				classified: aMethodModified protocol
				withStamp: nil
				notifying: nil
				logSource: false.
			self 
				forPharo12AndNewer: [
					(behavior includesSelector: selector) ifTrue: [
						(behavior>>selector) removeProperty: #source ] ] 
				forPharo11: [] ]
]
