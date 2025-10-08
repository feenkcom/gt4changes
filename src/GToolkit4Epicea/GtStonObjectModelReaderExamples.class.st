Class {
	#name : #GtStonObjectModelReaderExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #'test data' }
GtStonObjectModelReaderExamples class >> omClassDefinition [
	"Answer a OmEntry / EpBehaviorCommentChange in Pharo 11 format"
	
	^ 'OmEntry {
	#tags : {
		#author : ''AlistairGrant'',
		#time : DateAndTime [ ''2025-10-08T09:38:58.012215+02:00'' ],
		#prior : OmReference [ ''Pharo11-SNAPSHOT-64bit-aece1b5.234053B814E0'', ''1'' ],
		#self : OmReference [ ''1'' ]
	},
	#content : EpCategoryRegistration {
		#classCategoryName : #GtStonReaderPackage,
		#affectedPackageName : #GtStonReaderPackage
	}
}

OmEntry {
	#tags : {
		#author : ''AlistairGrant'',
		#time : DateAndTime [ ''2025-10-08T09:38:58.100306+02:00'' ],
		#prior : OmReference [ ''1'' ],
		#self : OmReference [ ''2'' ]
	},
	#content : EpCategoryAddition {
		#classCategoryName : #GtStonReaderPackage-GtStonTag,
		#affectedPackageName : #GtStonReaderPackage
	}
}

OmEntry {
	#tags : {
		#author : ''AlistairGrant'',
		#time : DateAndTime [ ''2025-10-08T09:38:58.211691+02:00'' ],
		#prior : OmReference [ ''2'' ],
		#self : OmReference [ ''3'' ]
	},
	#content : EpClassAddition {
		#class : RGClassDefinition {
			#annotations : IdentityDictionary {
				#superclassName : ''Object'',
				#definitionSource : ''Object subclass: #GtStonObjectModelReaderExampleClass\r\tinstanceVariableNames: \''iVar1\''\r\tclassVariableNames: \''CVar2\''\r\tpackage: \''GtStonReaderPackage-GtStonTag\'''',
				#traitCompositionSource : ''{}''
			},
			#name : #GtStonObjectModelReaderExampleClass,
			#methods : IdentityDictionary { },
			#protocols : Set [ ],
			#instanceVariables : OrderedCollection [
				RGInstanceVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #iVar1,
					#parent : @7
				}
			],
			#metaClass : RGMetaclassDefinition {
				#annotations : IdentityDictionary {
					#definitionSource : ''GtStonObjectModelReaderExampleClass class\r\tinstanceVariableNames: \''\'''',
					#traitCompositionSource : ''{}''
				},
				#name : #''GtStonObjectModelReaderExampleClass class'',
				#methods : IdentityDictionary { },
				#protocols : Set [ ],
				#instanceVariables : OrderedCollection [ ],
				#baseClass : @7
			},
			#comment : RGCommentDefinition {
				#annotations : IdentityDictionary {
					#className : #GtStonObjectModelReaderExampleClass,
					#isMetaSide : false
				},
				#parent : @7,
				#content : ''''
			},
			#classVariables : OrderedCollection [
				RGClassVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #CVar2,
					#parent : @7
				}
			],
			#category : #GtStonReaderPackage-GtStonTag,
			#package : #GtStonReaderPackage,
			#sharedPools : OrderedCollection [ ]
		}
	}
}

OmEntry {
	#tags : {
		#author : ''AlistairGrant'',
		#time : DateAndTime [ ''2025-10-08T09:38:58.239457+02:00'' ],
		#prior : OmReference [ ''3'' ],
		#self : OmReference [ ''4'' ]
	},
	#content : EpClassModification {
		#oldClass : RGClassDefinition {
			#annotations : IdentityDictionary {
				#superclassName : ''Object'',
				#definitionSource : ''Object subclass: #GtStonObjectModelReaderExampleClass\r\tinstanceVariableNames: \''iVar1\''\r\tclassVariableNames: \''CVar2\''\r\tpackage: \''GtStonReaderPackage-GtStonTag\'''',
				#traitCompositionSource : ''{}''
			},
			#name : #GtStonObjectModelReaderExampleClass,
			#methods : IdentityDictionary { },
			#protocols : Set [ ],
			#instanceVariables : OrderedCollection [
				RGInstanceVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #iVar1,
					#parent : @7
				}
			],
			#metaClass : RGMetaclassDefinition {
				#annotations : IdentityDictionary {
					#definitionSource : ''GtStonObjectModelReaderExampleClass class\r\tinstanceVariableNames: \''\'''',
					#traitCompositionSource : ''{}''
				},
				#name : #''GtStonObjectModelReaderExampleClass class'',
				#methods : IdentityDictionary { },
				#protocols : Set [ ],
				#instanceVariables : OrderedCollection [ ],
				#baseClass : @7
			},
			#comment : RGCommentDefinition {
				#annotations : IdentityDictionary {
					#className : #GtStonObjectModelReaderExampleClass,
					#isMetaSide : false
				},
				#parent : @7,
				#content : ''''
			},
			#classVariables : OrderedCollection [
				RGClassVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #CVar2,
					#parent : @7
				}
			],
			#category : #GtStonReaderPackage-GtStonTag,
			#package : #GtStonReaderPackage,
			#sharedPools : OrderedCollection [ ]
		},
		#newClass : RGClassDefinition {
			#annotations : IdentityDictionary {
				#superclassName : ''Object'',
				#definitionSource : ''Object subclass: #GtStonObjectModelReaderExampleClass\r\tinstanceVariableNames: \''iVar1\''\r\tclassVariableNames: \''CVar2\''\r\tpackage: \''GtStonReaderPackage-GtStonTag\'''',
				#traitCompositionSource : ''{}''
			},
			#name : #GtStonObjectModelReaderExampleClass,
			#methods : IdentityDictionary { },
			#protocols : Set [ ],
			#instanceVariables : OrderedCollection [
				RGInstanceVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #iVar1,
					#parent : @25
				}
			],
			#metaClass : RGMetaclassDefinition {
				#annotations : IdentityDictionary {
					#definitionSource : ''GtStonObjectModelReaderExampleClass class\r\tinstanceVariableNames: \''cVar1\'''',
					#traitCompositionSource : ''{}''
				},
				#name : #''GtStonObjectModelReaderExampleClass class'',
				#methods : IdentityDictionary { },
				#protocols : Set [ ],
				#instanceVariables : OrderedCollection [
					RGClassInstanceVariableDefinition {
						#annotations : IdentityDictionary {
							#className : #''GtStonObjectModelReaderExampleClass class'',
							#isMetaSide : true
						},
						#name : #cVar1,
						#parent : @32
					}
				],
				#baseClass : @25
			},
			#comment : RGCommentDefinition {
				#annotations : IdentityDictionary {
					#className : #GtStonObjectModelReaderExampleClass,
					#isMetaSide : false
				},
				#parent : @25,
				#content : ''''
			},
			#classVariables : OrderedCollection [
				RGClassVariableDefinition {
					#annotations : IdentityDictionary {
						#className : #GtStonObjectModelReaderExampleClass,
						#isMetaSide : false
					},
					#name : #CVar2,
					#parent : @25
				}
			],
			#category : #GtStonReaderPackage-GtStonTag,
			#package : #GtStonReaderPackage,
			#sharedPools : OrderedCollection [ ]
		}
	}
}

'
]

{ #category : #'llm-generated' }
GtStonObjectModelReaderExamples >> defaultMigratorCopiesValues [
	"Check that the default migrator successfully copies instance variables to the target instance"
	<gtExample>
	| reader model target |
	reader := GtStonObjectModelReader new.
	reader migrator: GtStonObjectMigrator new.
	model := GtStonObjectModel new.
	model targetClassName: #GtStonObjectModelReaderGenericStub.
	target := GtStonObjectModelReaderGenericStub new.
	model targetInstance: target.
	model instanceVariables at: 'name' put: 'LegacyName'.
	reader migrate: model.
	self assert: target name = 'LegacyName' description: 'Default migration should copy all instance variables'.
	^ target
]

{ #category : #examples }
GtStonObjectModelReaderExamples >> readPharo11RGClassDefinition [
	| readStream entries rgClassDefinition |
	<gtExample>

	readStream := self class omClassDefinition readStream.
	entries := OrderedCollection streamContents: [ :ocStream |
		[ readStream atEnd ] whileFalse:
			[ ocStream nextPut: (self readerWithRGClassMigrator on: readStream) next ] ].
	self assert: entries size equals: 4.
	self assert: (entries collect: [ :each | each content class name ] as: Array)
		equals: #(EpPackageAddition EpPackageTagAddition EpClassAddition EpClassModification).
	rgClassDefinition := entries third content behaviorAffected.
	self assert: rgClassDefinition name equals: #GtStonObjectModelReaderExampleClass.
	self assert: rgClassDefinition instanceVariables first name equals: #iVar1.
	self assert: rgClassDefinition classVariables first name equals: #CVar2.
	self assert: rgClassDefinition classSide instanceVariables isEmpty.
	rgClassDefinition := entries fourth content behaviorAffected.
	self assert: rgClassDefinition classSide instanceVariables first name equals: #cVar1.
]

{ #category : #'llm-generated' }
GtStonObjectModelReaderExamples >> readerWithRGClassMigrator [

	^ GtStonObjectModelReader forPharo11Epicea
]

{ #category : #'llm-generated' }
GtStonObjectModelReaderExamples >> rgClassDefinitionMigratorAdjustsPackageTag [
	<gtExample>
	| reader model target |
	reader := self readerWithRGClassMigrator.
	model := GtStonObjectModel new.
	model targetClassName: #RGClassDefinition.
	target := RGClassDefinition new.
	model targetInstance: target.
	model instanceVariables at: 'package' put: 'MyPackage'.
	model instanceVariables at: 'category' put: 'MyPackage-Tag'.
	reader migrate: model.
	self assert: target package = 'MyPackage' description: 'Package should be copied to the target instance'.
	self assert: target packageTag = 'Tag' description: 'Package tag should be derived from the category suffix'.
	self deny: (model instanceVariables includesKey: 'category') description: 'Category entry should be removed after migration'.
	^ target
]

{ #category : #'llm-generated' }
GtStonObjectModelReaderExamples >> storeInstanceVariablesCopiesValues [
	<gtExample>
	| reader model target |
	reader := GtStonObjectModelReader new.
	target := GtStonObjectModelReaderGenericStub new.
	model := GtStonObjectModel new.
	model targetInstance: target.
	model instanceVariables at: 'name' put: 'StoredValue'.
	reader storeInstanceVariablesFor: model.
	self assert: target name = 'StoredValue' description: 'storeInstanceVariablesFor: should copy the values to the target instance'.
	^ target
]
