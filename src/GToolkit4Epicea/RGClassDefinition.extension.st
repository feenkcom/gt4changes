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
