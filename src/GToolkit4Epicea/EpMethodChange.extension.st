Extension { #name : #EpMethodChange }

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> = other [

	^ self species = other species and: [ 
		self behaviorAffectedName = other behaviorAffectedName and: [ 
			self methodAffected = other methodAffected ] ]
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> affectedMarker [
	^ {  self behaviorAffectedName . self methodAffectedSelector }
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> gtAffectedPackageName [ 
	^ self methodAffected package 
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> gtDiffFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff';
		priority: 1;
		stencil: [ | previousContent newContent change |
			previousContent := self accept: EpOldStateVisitor new.
			newContent := self accept: EpNewStateVisitor new.

			change := GtDiffBuilder
					computeDifferencesFrom: previousContent
					to: newContent
					using: GtSmaCCDiffSplitter forPharo.
			GtEpiceaDiffElementWithLabelStencil new
				fromLabelText: 'Current:';
				toLabelText: 'Change:';
				ombuEntry: self;
				change: change;
				styler: (GtCodeDiffRBTextStyler new isForWorkspace: self isEpMethodChange not) ]
]

{ #category : #'*GToolkit4Epicea' }
EpMethodChange >> hash [
	^ self species hash
		bitXor: (self behaviorAffectedName hash bitXor: self methodAffected hash)
]
