Class {
	#name : #GtEpiceaMigrateDataFiles,
	#superclass : #Object,
	#instVars : [
		'fileMap'
	],
	#category : #'EpiceaMigration-GToolkit4Epicea'
}

{ #category : #migration }
GtEpiceaMigrateDataFiles class >> recreateResourceClass [

	^ self new recreateResourceClass
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> createEntriesMethodFor: child [
	| selector path |

	path := child relativeTo: self rootDir.
	selector := self methodSelectorForOmbuFilename: child basenameWithoutExtension.
	GtEpiceaMigrateGt4Epicea createEventMethod: selector from: child in: self targetClass.
	fileMap add: path -> selector.
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> createFileSystemMethod [

	self targetClass
		compile: self fileSystemMethodSource
		classified: 'private'
]

{ #category : #accessing }
GtEpiceaMigrateDataFiles >> dataDirs [

	^ #('GtEpEventSequencerExamples' 'GtEpLogEnumeratorExamples' 'GtEpReplayModelExamples')
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> fileSystemMethodSource [

	^ String streamContents: [ :stream |
		stream
			<< 'loadDataDir'; cr;
			cr;
			tab; << 'DataDir := self newMemoryFileSystem.'; cr;
			tab; << '{'; cr.
		fileMap do: [ :assoc |
			stream
				tab;
				print: assoc key pathString;
				<< ' -> self class ';
				<< assoc value;
				<< ' entries.';
				cr ].
		stream
			tab; << '} do: [ :assoc |'; cr;
			tab; tab; << 'self load: assoc key fromEntries: assoc value ].'; cr;
			tab; << '^ DataDir'; cr. ].
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> methodSelectorForOmbuFilename: aString [
	| id hasDash hasDot|

	id := aString copyFrom: (aString indexOf: $.)+1 to: aString size.
	hasDash := (id indexOf: $-) ~= 0.
	hasDot := (id indexOf: $.) ~= 0.
	^ ('ombu_', (hasDash | hasDot
		ifTrue: [ self string36: (SHA256 hashStream: aString readStream) ]
		ifFalse: [ id ])) asSymbol
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> migrateOmbuFilesIn: dirString [

	(self rootDir / dirString allChildrenMatching: '*.ombu') do: [ :child | 
		self createEntriesMethodFor: child ].
]

{ #category : #migration }
GtEpiceaMigrateDataFiles >> recreateResourceClass [

	fileMap := OrderedCollection new.
	self recreateTargetClass.
	self dataDirs do: [ :dirString |
		self migrateOmbuFilesIn: dirString. ].
	self createFileSystemMethod.
]

{ #category : #private }
GtEpiceaMigrateDataFiles >> recreateTargetClass [

	self targetClass ifNotNil:
		[ :cls | cls removeFromSystem ].
	Object subclass: self targetClassName
		instanceVariableNames: '' 
		classVariableNames: 'DataDir'
		category: 'GToolkit4Epicea'.
	self targetClass
		compile:
'newMemoryFileSystem

	^ FileSystem memory root'
			classified: 'initialization';
		compile:
'dataDir

	^ DataDir ifNil: [ self loadDataDir ]'
			classified: 'accessing';
		compile:
'load: pathString fromEntries: aCollection
	| fileReference |

	fileReference := DataDir / pathString.
	fileReference parent ensureCreateDirectory.
	fileReference writeStreamDo: [ :wStream |
		aCollection do: [ :epEvent |
			STON put: epEvent onStreamPretty: wStream ] ].'
			classified: 'private'.
	self targetClass class
		compile:
'reset

	DataDir := nil'
		classified: 'initialization'.
]

{ #category : #accessing }
GtEpiceaMigrateDataFiles >> rootDir [

	^ FileLocator gtResource / 'feenkcom' / 'gt4changes' / 'data'
]

{ #category : #'as yet unclassified' }
GtEpiceaMigrateDataFiles >> string36: aByteArray [
	"Answer the base36 encoding of the supplied byte array"
	| num |
	num := 0.
	1 to: aByteArray size do: [ :i | num := num + ((256 raisedTo: i - 1) * (aByteArray at: i)) ].
	^ (num printStringBase: 36) asLowercase
]

{ #category : #accessing }
GtEpiceaMigrateDataFiles >> targetClass [
	"Answer the target class.
	Only valid after it has been recreated."

	^ self class environment classOrTraitNamed: self targetClassName
]

{ #category : #accessing }
GtEpiceaMigrateDataFiles >> targetClassName [

	^ #GtEpiceaExampleOmbuFiles
]
