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
GtExportedEventApplyVisitor >> visitExpressionEvaluation: anExpressionChange [
	"Nothing to do"
]
