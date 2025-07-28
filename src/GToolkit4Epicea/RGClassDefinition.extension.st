Extension { #name : #RGClassDefinition }

{ #category : #'*GToolkit4Epicea' }
RGClassDefinition >> gtDefinitionFor: aView [
	<gtView>

	^ aView textEditor
		  title: 'Definition';
		  priority: 1;
		  styler: (BrRBTextStyler new
				   isForWorkspace: true;
				   yourself);
		  aptitude: BrGlamorousCodeEditorAptitude;
		  text: [ self definitionSource asRopedText ]
]

{ #category : #'*GToolkit4Epicea' }
RGClassDefinition >> gtDefinitionSource [
	"Answer a generated string that represents the receiver"

	^ String streamContents: [ :stream |
		stream
			<< self superclassName;
				<< ' subclass: #';
				<< self name; cr.
		self hasTraitComposition ifTrue:
			[ stream tab; << self traitCompositionSource; cr ].
		stream tab; << ' instanceVariableNames: '''.
		self instanceVariables
			do: [ :ivar | stream << ivar name ]
			separatedBy: [ stream space ].
		stream nextPut: $'; cr.
		stream tab; << ' classVariableNames: '''.
		self classVariables
			do: [ :cvar | stream << cvar name ]
			separatedBy: [ stream space ].
		stream nextPut: $'; cr.
		stream
			tab; << 'package: ''';
				<< self category;
				nextPut: $'; cr ].
]

{ #category : #'*GToolkit4Epicea' }
RGClassDefinition >> packageName [

	^ self forPharo12: [ self package name ]
		forPharo11AndPharo10: [ self package ]
]
