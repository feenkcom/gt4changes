Class {
	#name : #GtEpiceaExampleOmbuFiles,
	#superclass : #Object,
	#classVars : [
		'DataDir'
	],
	#category : #GToolkit4Epicea
}

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_1xu8qmkzudqml7bedqwpy26cf [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/11/2022 06:15') to: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/11/2022 06:15') tags: { #author -> 'akg'. #time -> '2022-12-11T06:17:08.348312+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfeaa5sxobgqxb41grx1' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/11/2022 06:15') tags: { #author -> 'akg'. #time -> '2022-12-11T06:17:08.375389+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '1'). } asDictionary.
factory removeProtocol: #accessing in: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-11T06:17:08.376185+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '2'). } asDictionary.
factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2936))' tags: { #author -> 'akg'. #time -> '2022-12-11T06:17:14.688863+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '3'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #Issue2936' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-11T06:17:14.72044+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf' localName: '4'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgempmdk8mj0pwknbzd68 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2958 packageName: #Issue2958 tags: { #author -> 'Unknown'. #time -> '2022-12-16T08:37:24.246038+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2958 definitionSource: 'Object subclass: #Issue2958
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2958''' superclassName: 'Object' package: #Issue2958 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2958 class' definitionSource: 'Issue2958 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-16T08:37:24.246916+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #classMethod1 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp1 sourceCode: 'classMethod1

	^ 1' stamp: 'akg 12/16/2022 08:37') tags: { #author -> 'akg'. #time -> '2022-12-16T08:37:49.973687+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp1 sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:04.437548+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '3'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp1 sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') to: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp2 sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:14.424866+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '4'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod1 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp1 sourceCode: 'classMethod1

	^ 1' stamp: 'akg 12/16/2022 08:37') to: (factory methodDefinitionSelector: #classMethod1 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #'as yet unclassified' sourceCode: 'classMethod1

	^ 1' stamp: 'akg 12/16/2022 08:37') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:22.995226+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '5'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #classMethod1 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp1 sourceCode: 'classMethod1

	^ 1' stamp: 'akg 12/16/2022 08:37') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:22.997844+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '6'). } asDictionary.
factory removeProtocol: #cp1 in: ((factory metaclassDefinitionName: #'Issue2958 class' definitionSource: 'Issue2958 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new) baseClass: (factory classDefinitionName: #Issue2958 definitionSource: 'Object subclass: #Issue2958
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2958''' superclassName: 'Object' package: #Issue2958 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: ''))) tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:22.998874+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '7'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp2 sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') to: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #'as yet unclassified' sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:29.647305+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '8'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #classMethod2 className: #'Issue2958 class' meta: true package: #Issue2958 protocol: #cp2 sourceCode: 'classMethod2

	^ 2' stamp: 'akg 12/16/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:29.650978+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '9'). } asDictionary.
factory removeProtocol: #cp2 in: ((factory metaclassDefinitionName: #'Issue2958 class' definitionSource: 'Issue2958 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new) baseClass: (factory classDefinitionName: #Issue2958 definitionSource: 'Object subclass: #Issue2958
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2958''' superclassName: 'Object' package: #Issue2958 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: ''))) tags: { #author -> 'akg'. #time -> '2022-12-16T08:38:29.65253+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68' localName: '10'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgfj165q3dvmnwi5wohpx [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936 packageName: #Issue2936 tags: { #author -> 'Unknown'. #time -> '2022-12-07T12:45:00.687489+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-07T12:45:00.691204+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '1'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''ignoredVar''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #ignoredVar className: #Issue2936 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-07T12:45:27.184221+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'AlistairGrant 12/7/2022 12:45') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:45:41.956572+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '3'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'AlistairGrant 12/7/2022 12:45') to: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'AlistairGrant 12/7/2022 12:45') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:45:41.967683+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '4'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''ignoredVar''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #ignoredVar className: #Issue2936Renamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936 tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:46:27.840018+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''ignoredVar''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #ignoredVar className: #Issue2936Renamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:46:34.65885+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '6'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''var1''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #var1 className: #Issue2936Renamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:46:48.61611+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '7'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method2

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:47') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:47:09.75265+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '8'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #anotherMethodToBeRenamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'anotherMethodToBeRenamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:47') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:47:55.284903+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '9'). } asDictionary.
factory genericRefactoring: 'Rename #anotherMethodToBeRenamed into #renamed' tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:20.879054+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '10'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #renamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'renamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:48') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:20.886215+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '11'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #anotherMethodToBeRenamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'anotherMethodToBeRenamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:47') to: (factory methodDefinitionSelector: #anotherMethodToBeRenamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'anotherMethodToBeRenamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:47') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:20.887439+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '12'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #anotherMethodToBeRenamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'anotherMethodToBeRenamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:47') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:20.921197+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '13'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgfj165q3dvmnxe4socg0 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #'Issue2936-2' packageName: #'Issue2936-2' tags: { #author -> 'Unknown'. #time -> '2022-12-08T08:05:16.694093+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936-2''' superclassName: 'Object' package: #'Issue2936-2' packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-08T08:05:16.695134+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '1'). } asDictionary.
	factory changeCommentFrom: '' stamp: '' to: 'Comment v1' stamp: 'akg 12/8/2022 08:05' in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v1')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:05:58.657445+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '2'). } asDictionary.
factory addProtocol: #protocolv1 in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v1')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:06:30.065318+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #protocolv1 sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') tags: { #author -> 'akg'. #time -> '2022-12-08T08:06:40.9969+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '4'). } asDictionary.
factory removeProtocol: #protocolv1 in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v1')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:06:50.031137+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '5'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #protocolv1 sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') to: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #protocolv2 sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') tags: { #author -> 'akg'. #time -> '2022-12-08T08:06:50.033546+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '6'). } asDictionary.
	factory changeCommentFrom: 'Comment v1' stamp: 'akg 12/8/2022 08:05' to: 'Comment v2' stamp: 'akg 12/8/2022 08:07' in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:07:00.366882+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '7'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #protocolv2 sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') to: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') tags: { #author -> 'akg'. #time -> '2022-12-08T08:07:26.060414+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '8'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #protocolv2 sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 08:06') tags: { #author -> 'akg'. #time -> '2022-12-08T08:07:26.086051+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '9'). } asDictionary.
factory removeProtocol: #protocolv2 in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:07:26.08785+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '10'). } asDictionary.
factory addProtocol: #another in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:08:13.412912+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '11'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #another sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') tags: { #author -> 'akg'. #time -> '2022-12-08T08:08:21.204747+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '12'). } asDictionary.
factory removeProtocol: #another in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:08:40.019876+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '13'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #another sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') to: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #anotherv2 sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') tags: { #author -> 'akg'. #time -> '2022-12-08T08:08:40.024861+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '15'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '14'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgfuoq0bg86t1y9x6ssxk [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'Unknown'. #time -> '2022-12-20T18:07:37.291673+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2961 definitionSource: 'Object subclass: #Issue2961
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2961 class' definitionSource: 'Issue2961 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-20T18:07:37.299459+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk' localName: '1'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgh5axfgk7r9vz60o6ajx [
	| factory |

	factory := GtEpiceaEventFactory new.

factory logRedo: { (OmReference globalName: '2adndgjuexboqu3v6rh8khwfe' localName: '1'). }  tags: { #author -> 'Unknown'. #time -> '2022-12-17T18:06:55.564301+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addCategory: #Issue2961 packageName: #Issue2961 tags: { #author -> 'Unknown'. #time -> '2022-12-17T18:06:55.596001+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2961Class definitionSource: 'Issu2961NonExistant subclass: #Issue2961Class
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2961''' superclassName: 'Issu2961NonExistant' package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2961Class class' definitionSource: 'Issue2961Class class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-17T18:06:55.599191+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '2'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndghvsp9xw8sezhqi6xatq [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936 packageName: #Issue2936 tags: { #author -> 'Unknown'. #time -> '2022-12-12T12:14:04.324335+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-12T12:14:04.325207+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '1'). } asDictionary.
	factory changeCommentFrom: '' stamp: '' to: 'Issue29936 comment' stamp: 'akg 12/12/2022 12:14' in: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Issue29936 comment')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-12T12:14:41.52364+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '2'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v1 definitionSource: 'Object subclass: #Issue2936v1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Issue29936 comment')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v1 class' definitionSource: 'Issue2936v1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936 tags: { #author -> 'akg'. #time -> '2022-12-12T12:15:00.295651+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgi1mh7mez3vu0od07o9f [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936 packageName: #Issue2936 tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:36:28.338047+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:36:28.341976+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '1'). } asDictionary.
	factory addCategory: #Issue2936v2 packageName: #Issue2936v2 tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:37:31.009786+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '2'). } asDictionary.
	factory changeBehaviorFrom: #Issue2936 package: nil to: #Issue2936v2 in: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:37:31.074208+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:37:48.966708+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '4'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936 tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:38:25.466152+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''iv2''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-10T08:38:33.40535+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f' localName: '6'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgi1mh7mez3vuyyeo7oxr [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'Unknown'. #time -> '2023-01-10T10:47:06.276157+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheck definitionSource: 'Object subclass: #GtEpEventSequencerExampleCheck
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheck class' definitionSource: 'GtEpEventSequencerExampleCheck class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2023-01-10T10:47:06.277115+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleCheck meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 1/10/2023 10:47') tags: { #author -> 'akg'. #time -> '2023-01-10T10:47:40.078212+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleCheck meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 1/10/2023 10:47') to: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleCheck meta: false package: #GtEpEventSequencerExampleChecks protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 1/10/2023 10:47') tags: { #author -> 'akg'. #time -> '2023-01-10T10:47:40.093013+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '3'). } asDictionary.
factory removeProtocol: #accessing in: ((factory classDefinitionName: #GtEpEventSequencerExampleCheck definitionSource: 'Object subclass: #GtEpEventSequencerExampleCheck
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheck class' definitionSource: 'GtEpEventSequencerExampleCheck class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2023-01-10T10:48:06.04352+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '4'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleCheck meta: false package: #GtEpEventSequencerExampleChecks protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 1/10/2023 10:47') to: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleCheck meta: false package: #GtEpEventSequencerExampleChecks protocol: #protocol2 sourceCode: 'method1

	^ 1' stamp: 'akg 1/10/2023 10:47') tags: { #author -> 'akg'. #time -> '2023-01-10T10:48:06.045579+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr' localName: '5'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgji2gjod2o288oibtkgo [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpReplayModelExamplesCheck packageName: #GtEpReplayModelExamplesCheck tags: { #author -> 'Unknown'. #time -> '2023-01-13T18:10:22.828605+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpReplayModelExamplesCheck definitionSource: 'Object subclass: #GtEpReplayModelExamplesCheck
	instanceVariableNames: ''iv1''
	classVariableNames: ''Cv1''
	package: ''GtEpReplayModelExamplesCheck''' superclassName: 'Object' package: #GtEpReplayModelExamplesCheck packageTag: nil classVariables: (OrderedCollection withAll: { factory classVariableDefinitionNamed: #Cv1 className: #GtEpReplayModelExamplesCheck isMeta: false}) instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #GtEpReplayModelExamplesCheck isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpReplayModelExamplesCheck class' definitionSource: 'GtEpReplayModelExamplesCheck class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2023-01-13T18:10:22.832579+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #instanceMethod1 className: #GtEpReplayModelExamplesCheck meta: false package: #GtEpReplayModelExamplesCheck protocol: #'as yet unclassified' sourceCode: 'instanceMethod1

	^ ''im1''' stamp: 'akg 1/13/2023 18:10') tags: { #author -> 'akg'. #time -> '2023-01-13T18:10:49.354623+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #instanceMethod1 className: #GtEpReplayModelExamplesCheck meta: false package: #GtEpReplayModelExamplesCheck protocol: #'as yet unclassified' sourceCode: 'instanceMethod1

	^ ''im1''' stamp: 'akg 1/13/2023 18:10') to: (factory methodDefinitionSelector: #instanceMethod1 className: #GtEpReplayModelExamplesCheck meta: false package: #GtEpReplayModelExamplesCheck protocol: #accessing sourceCode: 'instanceMethod1

	^ ''im1''' stamp: 'akg 1/13/2023 18:10') tags: { #author -> 'akg'. #time -> '2023-01-13T18:10:58.907358+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtEpReplayModelExamplesCheck class' meta: true package: #GtEpReplayModelExamplesCheck protocol: #'as yet unclassified' sourceCode: 'classMethod1

	^ ''cm1''' stamp: 'akg 1/13/2023 18:11') tags: { #author -> 'akg'. #time -> '2023-01-13T18:11:10.063772+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '4'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtEpReplayModelExamplesCheck class' meta: true package: #GtEpReplayModelExamplesCheck protocol: #'as yet unclassified' sourceCode: 'classMethod1

	^ ''cm1''' stamp: 'akg 1/13/2023 18:11') to: (factory methodDefinitionSelector: #classMethod1 className: #'GtEpReplayModelExamplesCheck class' meta: true package: #GtEpReplayModelExamplesCheck protocol: #accessing sourceCode: 'classMethod1

	^ ''cm1''' stamp: 'akg 1/13/2023 18:11') tags: { #author -> 'akg'. #time -> '2023-01-13T18:11:15.186883+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo' localName: '5'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_2adndgjmtcjlis884c9ofhcmo [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936 packageName: #Issue2936 tags: { #author -> 'Unknown'. #time -> '2022-12-12T08:37:33.861927+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936 definitionSource: 'Object subclass: #Issue2936
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936 class' definitionSource: 'Issue2936 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-12T08:37:33.862847+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/12/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-12T08:38:35.010407+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/12/2022 08:38') to: (factory methodDefinitionSelector: #method1 className: #Issue2936 meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/12/2022 08:38') tags: { #author -> 'akg'. #time -> '2022-12-12T08:38:35.0247+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '3'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v1 definitionSource: 'Object subclass: #Issue2936v1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936''' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v1 class' definitionSource: 'Issue2936v1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936 tags: { #author -> 'akg'. #time -> '2022-12-12T08:39:01.001288+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo' localName: '4'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_313x18caa4oyvcekylktb7i4k [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addTrait: ((factory traitDefinitionName: #TTestTrait2 definitionSource: 'Trait named: #TTestTrait2
	instanceVariableNames: ''''
	package: ''TestPackage''' superclassName: #Trait package: #TestPackage packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TTestTrait2 classTrait' definitionSource: 'TTestTrait2 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-10-31T06:31:41.590035+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #aNumber className: #TTestTrait2 meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'aNumber

	^ 42' stamp: 'akg 10/31/2022 06:31') tags: { #author -> 'akg'. #time -> '2022-10-31T06:31:56.085882+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '1'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #aNumber className: #TTestTrait2 meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'aNumber

	^ 42' stamp: 'akg 10/31/2022 06:31') to: (factory methodDefinitionSelector: #aNumber className: #TTestTrait2 meta: false package: #TestPackage protocol: #accessing sourceCode: 'aNumber

	^ 42' stamp: 'akg 10/31/2022 06:31') tags: { #author -> 'akg'. #time -> '2022-10-31T06:32:02.256239+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #TestClass2 definitionSource: 'Object subclass: #TestClass2
	uses: TTestTrait2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''TestPackage''' superclassName: 'Object' package: #TestPackage packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'TestClass2 class' definitionSource: 'TestClass2 class
	uses: TTestTrait2 classTrait
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-10-31T06:32:40.003831+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '3'). } asDictionary.
	factory modifyTrait: ((factory traitDefinitionName: #TTestTrait2 definitionSource: 'Trait named: #TTestTrait2
	instanceVariableNames: ''''
	package: ''TestPackage''' superclassName: #Trait package: #TestPackage packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TTestTrait2 classTrait' definitionSource: 'TTestTrait2 classTrait
	instanceVariableNames: ''''')) to: ((factory traitDefinitionName: #TTestTrait2 definitionSource: 'Trait named: #TTestTrait2
	instanceVariableNames: ''tt2Var''
	package: ''TestPackage''' superclassName: #Trait package: #TestPackage packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TTestTrait2 classTrait' definitionSource: 'TTestTrait2 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:00.312909+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '4'). } asDictionary.
factory genericRefactoring: '(RBCreateAccessorsForVariableRefactoring variable: #tt2Var class: TTestTrait2 classVariable: false)' tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:06.614563+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '5'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #tt2Var className: #TTestTrait2 meta: false package: #TestPackage protocol: #accessing sourceCode: 'tt2Var

	^ tt2Var' stamp: 'akg 10/31/2022 06:33') tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:06.635094+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '6'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #tt2Var: className: #TTestTrait2 meta: false package: #TestPackage protocol: #accessing sourceCode: 'tt2Var: anObject

	tt2Var := anObject' stamp: 'akg 10/31/2022 06:33') tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:06.643868+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '7'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #initialize className: #TestClass2 meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'initialize

	super initialize.
	self tt2Var: 43.' stamp: 'akg 10/31/2022 06:33') tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:24.989627+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '8'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #initialize className: #TestClass2 meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'initialize

	super initialize.
	self tt2Var: 43.' stamp: 'akg 10/31/2022 06:33') to: (factory methodDefinitionSelector: #initialize className: #TestClass2 meta: false package: #TestPackage protocol: #initialization sourceCode: 'initialize

	super initialize.
	self tt2Var: 43.' stamp: 'akg 10/31/2022 06:33') tags: { #author -> 'akg'. #time -> '2022-10-31T06:33:25.008017+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k' localName: '9'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3699hxpexw9en86vig1dlpbso [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'Unknown'. #time -> '2022-12-19T10:10:50.718323+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4t3kg4teawebg1xv32kkdcbda' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2961 definitionSource: 'Object subclass: #Issue2961
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2961 class' definitionSource: 'Issue2961 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-19T10:10:50.721937+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #issue2961ObjectExtensionMethod className: #Object meta: false package: #Kernel protocol: #'as yet unclassified' sourceCode: 'issue2961ObjectExtensionMethod

	^ 1' stamp: 'akg 12/19/2022 10:11') tags: { #author -> 'akg'. #time -> '2022-12-19T10:11:16.390578+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #issue2961ObjectExtensionMethod className: #Object meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'issue2961ObjectExtensionMethod

	^ 1' stamp: 'akg 12/19/2022 10:11') to: (factory methodDefinitionSelector: #issue2961ObjectExtensionMethod className: #Object meta: false package: #GtEpEventSequencerExampleChecks protocol: #'*GtEpEventSequencerExampleChecks' sourceCode: 'issue2961ObjectExtensionMethod

	^ 1' stamp: 'akg 12/19/2022 10:11') tags: { #author -> 'akg'. #time -> '2022-12-19T10:11:16.430389+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3D1E2A5A5F98 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue3420 packageName: #Issue3420 tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:41:03.329895+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '1'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.36BA03008E28' localName: '332'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3420Superclass definitionSource: 'Object subclass: #Issue3420Superclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Object' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Superclass class' definitionSource: 'Issue3420Superclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:41:03.352174+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '2'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3420Subclass definitionSource: 'Issue3420Superclass subclass: #Issue3420Subclass
	instanceVariableNames: ''varA varB''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Issue3420Superclass' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varA className: #Issue3420Subclass isMeta: false. factory instanceVariableDefinitionNamed: #varB className: #Issue3420Subclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Subclass class' definitionSource: 'Issue3420Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:41:58.066324+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '3'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #methodA className: #Issue3420Subclass meta: false package: #Issue3420 protocol: #accessing sourceCode: 'methodA
	^ ''A''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:42:23.78674+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '4'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #methodB className: #Issue3420Superclass meta: false package: #Issue3420 protocol: #accessing sourceCode: 'methodB
	^ ''B''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:42:31.408341+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '5'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '4'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3420Subclass definitionSource: 'Issue3420Superclass subclass: #Issue3420Subclass
	instanceVariableNames: ''varA varB''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Issue3420Superclass' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varA className: #Issue3420Subclass isMeta: false. factory instanceVariableDefinitionNamed: #varB className: #Issue3420Subclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Subclass class' definitionSource: 'Issue3420Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3420Subclass definitionSource: 'Issue3420Superclass subclass: #Issue3420Subclass
	instanceVariableNames: ''varB''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Issue3420Superclass' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varB className: #Issue3420Subclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Subclass class' definitionSource: 'Issue3420Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:43:29.215229+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '6'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3420Superclass definitionSource: 'Object subclass: #Issue3420Superclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Object' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Superclass class' definitionSource: 'Issue3420Superclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3420Superclass definitionSource: 'Object subclass: #Issue3420Superclass
	instanceVariableNames: ''varA''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Object' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varA className: #Issue3420Superclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Superclass class' definitionSource: 'Issue3420Superclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:43:29.712222+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '7'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '6'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3420Subclass definitionSource: 'Issue3420Superclass subclass: #Issue3420Subclass
	instanceVariableNames: ''varB''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Issue3420Superclass' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varB className: #Issue3420Subclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Subclass class' definitionSource: 'Issue3420Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3420Subclass definitionSource: 'Issue3420Superclass subclass: #Issue3420Subclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Issue3420Superclass' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Subclass class' definitionSource: 'Issue3420Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:43:33.894749+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '8'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '7'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3420Superclass definitionSource: 'Object subclass: #Issue3420Superclass
	instanceVariableNames: ''varA''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Object' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varA className: #Issue3420Superclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Superclass class' definitionSource: 'Issue3420Superclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3420Superclass definitionSource: 'Object subclass: #Issue3420Superclass
	instanceVariableNames: ''varA varB''
	classVariableNames: ''''
	package: ''Issue3420''' superclassName: 'Object' package: #Issue3420 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #varA className: #Issue3420Superclass isMeta: false. factory instanceVariableDefinitionNamed: #varB className: #Issue3420Superclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3420Superclass class' definitionSource: 'Issue3420Superclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-24T18:43:34.405576+03:00'. #self -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '9'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98' localName: '8'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3bak9h9f6v0rt870ok3zaoyvu [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue3490 packageName: #Issue3490 tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:27:40.90844+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.1p65e7e22bl4yd3f85d68dkbr' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3490RootClass definitionSource: 'Object subclass: #Issue3490RootClass
	instanceVariableNames: ''slotA''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Object' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotA className: #Issue3490RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490RootClass class' definitionSource: 'Issue3490RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:27:40.917975+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3490SubClass definitionSource: 'Issue3490RootClass subclass: #Issue3490SubClass
	instanceVariableNames: ''slotB''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Issue3490RootClass' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3490SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490SubClass class' definitionSource: 'Issue3490SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:27:58.393699+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #methodB className: #Issue3490SubClass meta: false package: #Issue3490 protocol: #accessing sourceCode: 'methodB
	^ ''B''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:28:08.875274+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3490RootClass definitionSource: 'Object subclass: #Issue3490RootClass
	instanceVariableNames: ''slotA''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Object' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotA className: #Issue3490RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490RootClass class' definitionSource: 'Issue3490RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3490RootClass definitionSource: 'Object subclass: #Issue3490RootClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Object' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490RootClass class' definitionSource: 'Issue3490RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:28:17.507497+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '4'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3490SubClass definitionSource: 'Issue3490RootClass subclass: #Issue3490SubClass
	instanceVariableNames: ''slotB''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Issue3490RootClass' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3490SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490SubClass class' definitionSource: 'Issue3490SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3490SubClass definitionSource: 'Issue3490RootClass subclass: #Issue3490SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Issue3490RootClass' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3490SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3490SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490SubClass class' definitionSource: 'Issue3490SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:28:26.499562+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3490SubClass definitionSource: 'Issue3490RootClass subclass: #Issue3490SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Issue3490RootClass' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3490SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3490SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490SubClass class' definitionSource: 'Issue3490SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3490SubClass definitionSource: 'Object subclass: #Issue3490SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3490''' superclassName: 'Object' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3490SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3490SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3490SubClass class' definitionSource: 'Issue3490SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:28:33.89234+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '6'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue3490RootClass definitionSource: 'Object subclass: #Issue3490RootClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #Issue3490' superclassName: 'Object' package: #Issue3490 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue3490RootClass class' definitionSource: 'Issue3490RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T10:28:46.418175+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu' localName: '7'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3bak9h9f6v0rt870ok8lrvvor [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue3491 packageName: #Issue3491 tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:14:58.326004+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.1p65e7e22bl4yd3f85d68dkbr' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3491RootClass definitionSource: 'Object subclass: #Issue3491RootClass
	instanceVariableNames: ''slotA''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Object' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotA className: #Issue3491RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491RootClass class' definitionSource: 'Issue3491RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:14:58.333608+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3491SubClass definitionSource: 'Issue3491RootClass subclass: #Issue3491SubClass
	instanceVariableNames: ''slotB''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Issue3491RootClass' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3491SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491SubClass class' definitionSource: 'Issue3491SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:15:34.189928+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '2'). } asDictionary.
	factory addSessionSnapshotImageName: '/Users/andrei/Downloads/GlamorousToolkit-MacOS-x86_64-v1.0.166/GlamorousToolkit.image' tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:15:51.131913+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3di355b76zwcwynp2ykcbwwew [
	| factory |

	factory := GtEpiceaEventFactory new.

factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#TIssue2936v2))' tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.6639+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a' localName: '2'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #tmethod1 className: #TIssue2936v2 meta: false package: #Issue2936v3 protocol: #accessing sourceCode: 'tmethod1

	^ 1' stamp: 'akg 12/8/2022 11:17') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.716031+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '1'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #hasTraitComposition className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'hasTraitComposition
	
	^ self traitComposition isEmpty not' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.716931+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '2'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #recompile:from: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #recompilation sourceCode: 'recompile: selector from: oldClass
	"Compile the method associated with selector in the receiver''s method dictionary."

	| method newMethod |
	method := oldClass compiledMethodAt: selector.
	newMethod := self compiler
				source: (oldClass sourceCodeAt: selector);
				class: self;
				failBlock: [^ self];
				compiledMethodTrailer: method trailer;
				compile.   "Assume OK after proceed from SyntaxError"
	selector == newMethod selector ifFalse: [self error: ''selector changed!''].
	
	method properties 
		at: #traitSource 
		ifPresent: [ :aSource | newMethod propertyAt: #traitSource put: aSource].
	
	self addSelector: selector withRecompiledMethod: newMethod.' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.717602+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '3'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localSelectors className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #'accessing - method dictionary' sourceCode: 'localSelectors
	
	^ self localMethodDict keys' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.718083+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #findOriginClassOf: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'findOriginClassOf: aMethod

	"I return the myself or the trait that has the original implementation of a method.
	If the method is an alias, the returned class includes the original aliased method"

	(aMethod hasProperty: #traitSource) 
		ifTrue: [ ^ aMethod traitSource innerClass ]. 

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ self ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ ^ self ]) innerClass' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.718432+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '5'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #allTraits className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #querying sourceCode: 'allTraits
	^ self traitComposition allTraits' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.718747+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '6'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitComposition: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'traitComposition: aComposition
	
	aComposition asTraitComposition allTraits do: [ :aMaybeTrait |
		aMaybeTrait isTrait ifFalse: [ 
			self error: ''All the members of the trait composition should be traits'' ]].
		
	self class baseComposition: aComposition' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.719078+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '7'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitComposition className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'traitComposition
	"My trait composition is in my class. So I do not need to recompile the methods when installing them during bootstrap"
	^ self class baseComposition' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.719403+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '8'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #fileOutLocalMethodsInCategory:on: className: #'TIssue2936v2 classTrait' meta: true package: #'CodeExport-Traits' protocol: #'*CodeExport-Traits' sourceCode: 'fileOutLocalMethodsInCategory: aSymbol on: aFileStream
	| selectors |
	
	aFileStream cr.
	selectors := self selectorsToFileOutCategory: aSymbol.
		
	selectors do: [:sel | 
		((self isLocalSelector: sel) or: [ (self traitComposition selectors includes: sel) not]) ifTrue: [ 
		self printMethodChunk: sel on: aFileStream ]].
	
	^ self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.719933+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '9'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethodDict className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'localMethodDict
	"The local methodDict is in the metaclass. In this way I do not have to recompile the methods during the bootstrap when we don''t have a compiler."
	^ self class baseLocalMethods' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.72026+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '10'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traits className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'traits
	^ self traitComposition traits' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.720554+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '11'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #recategorizeSelector:from:to: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #categories sourceCode: 'recategorizeSelector: selector from: oldCategory to: newCategory
	| original |
	
	"When a method is recategorized I have to classify the method, but also recategorize the aliases pointing to it"
	
	original := self organization categoryOfElement: selector ifAbsent: [ ^ self ].

	"If it is nil is because it is a removal. It will removed when the method is removed."
	newCategory ifNil: [ ^ self ].

	original = oldCategory
		ifTrue: [ self organization classify: selector under: newCategory suppressIfDefault: true ].

	(self traitComposition reverseAlias: selector) do: [ :e | 
		self recategorizeSelector: e from: oldCategory to: newCategory. 
		self notifyOfRecategorizedSelector: e from: oldCategory to: newCategory ].
	
	self organization removeEmptyCategories' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.720888+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '12'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalMethodsProtocol: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'isLocalMethodsProtocol: aProtocol
	"Checks if the protocol has local selectors"

	aProtocol methodSelectors ifEmpty: [ ^ true ].
	^ aProtocol methodSelectors anySatisfy: [ :each | self isLocalSelector: each ]' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.721174+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '13'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #includesLocalSelector: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'includesLocalSelector: aSymbol
	^ self isLocalSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.721454+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '15'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '14'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #removeSelector: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #removing sourceCode: 'removeSelector: aSelector

	"When a selector is removed it should be notified to my users.
	Check the class TraitChange for more details"
	super removeSelector: aSelector.
	self localMethodDict removeKey: aSelector ifAbsent: [  ].

	TraitChange removeSelector: aSelector on: self.' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.721757+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '16'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '15'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addAndClassifySelector:withMethod:inProtocol: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #'accessing - method dictionary' sourceCode: 'addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aCategory
	
	"When a new methods is added, I add it to the localMethodDict and also propagate the changes to my users"
	self localMethodDict at: selector put: compiledMethod.
	
	super
		addAndClassifySelector: selector
		withMethod: compiledMethod
		inProtocol: aCategory.

	TraitChange addSelector: selector on: self.	' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.722148+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '17'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '16'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalSelector: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'isLocalSelector: aSelector
	
	^ self localMethodDict includesKey: aSelector' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.722422+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '18'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '17'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addSelector:withRecompiledMethod: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #'accessing - method dictionary' sourceCode: 'addSelector: selector withRecompiledMethod: compiledMethod 
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	compiledMethod isFromTrait 
		ifTrue: [ ^ super addSelector: selector withRecompiledMethod: compiledMethod ].
	
	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withRecompiledMethod: compiledMethod.
	TraitChange addSelector: selector on: self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.722815+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '19'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '18'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethodDict: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'localMethodDict: aMethodDictionary
	^ self class baseLocalMethods: aMethodDictionary ' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.723103+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '20'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '19'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #findOriginMethodOf: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'findOriginMethodOf: aMethod

	"I return the original method for a aMethod.
	If this is a local method, the original method is itself.
	If it cames from a trait composition I look for the method in the trait composition.
	First I try with the trait stored in the traitSource. 
	If it is an aliased or conflicting method, the method is look up in the whole trait composition"

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ aMethod ].

	(aMethod hasProperty: #traitSource)
		ifTrue: [ |newSelector|
			newSelector := self traitComposition originSelectorOf: aMethod selector.
			^ aMethod traitSource compiledMethodAt: newSelector ifAbsent: [aMethod] ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ self ])
		compiledMethodAt: aMethod selector ifAbsent: [ ^ aMethod ]		
' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.723417+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '21'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '20'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #removeFromComposition: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #'trait-composition' sourceCode: 'removeFromComposition: aTrait

	self setTraitComposition: (self traitComposition copyWithoutTrait: aTrait asTraitComposition)' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.723739+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '22'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '21'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addSelector:withMethod: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #'accessing - method dictionary' sourceCode: 'addSelector: selector withMethod: compiledMethod
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"
	
	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withMethod: compiledMethod.
	TraitChange addSelector: selector on: self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.724122+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '23'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '22'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethods className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'localMethods
	"returns the methods of classes excluding the ones of the traits that the class uses" 
	 
	^ self localMethodDict values' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.72441+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '24'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '23'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isAliasSelector: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'isAliasSelector: aSymbol
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in 
	the tree of traits compositions."

	^ self traitComposition isAliasSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.724701+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '25'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '24'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #doRebuildMethodDictionary className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #initialization sourceCode: 'doRebuildMethodDictionary
	| selectors removedSelectors removeFromOrganization modified|

	"During the creation of the class or after a change in the traitComposition, the whole method dictionary is calculated.
	If I return true, my users should be updated"

	"1. I recreate the local methodDict"
	modified := false.
	self methodDict valuesDo: [ :m | m traitSource ifNil: [ self localMethodDict at: m selector put: m ]].

	"2. I filter the selectors from the trait composition, rejecting the ones that are locally defined.
	And then I install the methods in myself. The trait composition only install the method if it is needed."
	selectors := self traitComposition selectors reject: [ :e | (self localMethodDict includesKey: e) ].
	selectors do: [ :e | modified := modified | (self traitComposition installSelector: e into: self replacing: false)].

	"3. I handle the methods that I have and they are no more in the traitComposition."
	removedSelectors := self methodDict keys reject: [ :aSelector | (selectors includes: aSelector) or: [ self localMethodDict includesKey: aSelector] ].
	modified := modified | (removedSelectors isNotEmpty).
	removedSelectors do: [ :aSelector | self methodDict removeKey: aSelector ].

	"4. Finally, I remove these methods from my class organization"
	removeFromOrganization := self organization allMethodSelectors reject: [:e | self methodDict includesKey: e ].
	removeFromOrganization do: [ :aSelector | self organization removeElement: aSelector ].

	^ modified' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.725081+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '26'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '25'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalAliasSelector: className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #testing sourceCode: 'isLocalAliasSelector: aSymbol
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^ self traitComposition isLocalAliasSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.725351+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '27'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '26'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitCompositionString className: #'TIssue2936v2 classTrait' meta: true package: #Issue2936v3 protocol: #accessing sourceCode: 'traitCompositionString
	^ self traitComposition asString' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.725605+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '28'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '27'). } asDictionary.
factory removeTrait: ((factory traitDefinitionName: #TIssue2936v2 definitionSource: 'Trait named: #TIssue2936v2
	instanceVariableNames: ''tvar1''
	package: #Issue2936v3' superclassName: #Trait package: #Issue2936v3 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'AnObsoleteTIssue2936v2 classTrait' definitionSource: 'TIssue2936v2 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:52.725627+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '29'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew' localName: '28'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3dsjiizgjzilekro4fb7a5dr4 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtGemStoneExamples packageName: #GtGemStoneExamples tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:37.714428+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4gdds852nnhied7a8vn1xs0jh' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClass definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtGemStoneExamples''' superclassName: 'Object' package: #GtGemStoneExamples packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClass class' definitionSource: 'GtGemStoneCodeSyncExampleClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:37.748411+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '1'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClass definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtGemStoneExamples''' superclassName: 'Object' package: #GtGemStoneExamples packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClass class' definitionSource: 'GtGemStoneCodeSyncExampleClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClass definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClass
	instanceVariableNames: ''iVar1''
	classVariableNames: ''''
	package: ''GtGemStoneExamples''' superclassName: 'Object' package: #GtGemStoneExamples packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iVar1 className: #GtGemStoneCodeSyncExampleClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClass class' definitionSource: 'GtGemStoneCodeSyncExampleClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:38.019186+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '2'). } asDictionary.
	factory changeCommentFrom: '' stamp: '' to: 'comment 1' stamp: '<historical>' in: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClass definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClass
	instanceVariableNames: ''iVar1''
	classVariableNames: ''''
	package: ''GtGemStoneExamples''' superclassName: 'Object' package: #GtGemStoneExamples packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iVar1 className: #GtGemStoneCodeSyncExampleClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: 'comment 1')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClass class' definitionSource: 'GtGemStoneCodeSyncExampleClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:38.259308+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '3'). } asDictionary.
	factory addCategory: #GtGemStoneExamples2 packageName: #GtGemStoneExamples2 tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:38.89587+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '4'). } asDictionary.
	factory changeBehaviorFrom: #GtGemStoneExamples package: 'GtGemStoneExamples' to: #GtGemStoneExamples2 in: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClass definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClass
	instanceVariableNames: ''iVar1''
	classVariableNames: ''''
	package: ''GtGemStoneExamples2''' superclassName: 'Object' package: #GtGemStoneExamples2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iVar1 className: #GtGemStoneCodeSyncExampleClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: 'comment 1')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClass class' definitionSource: 'GtGemStoneCodeSyncExampleClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.233468+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '5'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClass meta: false package: #GtGemStoneExamples2 protocol: #'category 1' sourceCode: 'method1 ^ 1' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.237756+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '6'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClass meta: false package: #GtGemStoneExamples2 protocol: #'category 1' sourceCode: 'method1 ^ 1' stamp: 'AlistairGrant 10/13/2023 14:22') to: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClass meta: false package: #GtGemStoneExamples2 protocol: #'category 1' sourceCode: 'method1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.241275+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '7'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClass class' meta: true package: #GtGemStoneExamples2 protocol: #'class category 1' sourceCode: 'classMethod1 ^ 1' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.246526+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '8'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClass class' meta: true package: #GtGemStoneExamples2 protocol: #'class category 1' sourceCode: 'classMethod1 ^ 1' stamp: 'AlistairGrant 10/13/2023 14:22') to: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClass class' meta: true package: #GtGemStoneExamples2 protocol: #'class category 1' sourceCode: 'classMethod1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.249195+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '9'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClassRenamed definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClassRenamed
	instanceVariableNames: ''iVar1''
	classVariableNames: ''''
	package: ''GtGemStoneExamples2''' superclassName: 'Object' package: #GtGemStoneExamples2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iVar1 className: #GtGemStoneCodeSyncExampleClassRenamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: 'comment 1')) withMetaclass: (factory metaclassDefinitionName: #'GtGemStoneCodeSyncExampleClassRenamed class' definitionSource: 'GtGemStoneCodeSyncExampleClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #GtGemStoneCodeSyncExampleClass tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.255783+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '10'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClassRenamed meta: false package: #GtGemStoneExamples2 protocol: #'category 1' sourceCode: 'method1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') to: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClassRenamed meta: false package: #GtGemStoneExamples2 protocol: #'as yet unclassified' sourceCode: 'method1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.294549+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '11'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method1 className: #GtGemStoneCodeSyncExampleClassRenamed meta: false package: #GtGemStoneExamples2 protocol: #'category 1' sourceCode: 'method1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.296427+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '12'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClassRenamed class' meta: true package: #GtGemStoneExamples2 protocol: #'class category 1' sourceCode: 'classMethod1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') to: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClassRenamed class' meta: true package: #GtGemStoneExamples2 protocol: #'as yet unclassified' sourceCode: 'classMethod1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.298851+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '13'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #classMethod1 className: #'GtGemStoneCodeSyncExampleClassRenamed class' meta: true package: #GtGemStoneExamples2 protocol: #'class category 1' sourceCode: 'classMethod1 ^ 2' stamp: 'AlistairGrant 10/13/2023 14:22') tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.301617+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '15'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '14'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #GtGemStoneCodeSyncExampleClassRenamed definitionSource: 'Object subclass: #GtGemStoneCodeSyncExampleClassRenamed
	instanceVariableNames: ''iVar1''
	classVariableNames: ''''
	package: #GtGemStoneExamples2' superclassName: 'Object' package: #GtGemStoneExamples2 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iVar1 className: #AnObsoleteGtGemStoneCodeSyncExampleClassRenamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: 'comment 1')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteGtGemStoneCodeSyncExampleClassRenamed class' definitionSource: 'GtGemStoneCodeSyncExampleClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-10-13T14:22:39.635745+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '16'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4' localName: '15'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_3fkffmpy2gp0kuve9ssl19c3k29tr1g47dv2aki9eb738drdhe [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addSessionSnapshotImageName: '/home/alistair/gt/gt063/glamoroustoolkit/GlamorousToolkit.image' tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:15:42.050042+01:00'. #self -> (OmReference globalName: 'Issue3529-1' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9es0ezzihcodpn40a7diouchg' localName: '5'). } asDictionary.
	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:16:35.085205+01:00'. #self -> (OmReference globalName: 'Issue3529-1' localName: '4'). #prior -> (OmReference globalName: 'Issue3529-1' localName: '3'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass1 definitionSource: 'Object subclass: #GtEpEventSequencerExampleClass1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass1 class' definitionSource: 'GtEpEventSequencerExampleClass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:16:35.088151+01:00'. #self -> (OmReference globalName: 'Issue3529-1' localName: '5'). #prior -> (OmReference globalName: 'Issue3529-1' localName: '4'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'GtEpEventSequencerExampleClass1 subclass: #GtEpEventSequencerExampleClass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleClass1' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:16:46.174134+01:00'. #self -> (OmReference globalName: 'Issue3529-1' localName: '6'). #prior -> (OmReference globalName: 'Issue3529-1' localName: '5'). } asDictionary.
	factory addSessionSnapshotImageName: '/home/alistair/gt/gt063/glamoroustoolkit/GlamorousToolkit.image' tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:17:05.21575+01:00'. #self -> (OmReference globalName: 'Issue3529-1' localName: '7'). #prior -> (OmReference globalName: 'Issue3529-1' localName: '6'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_4i0wvlvo02nxps5csied8ix6w [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #method2 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method2

	^ ''This method will be saved in this session.''' stamp: 'akg 10/27/2022 19:02') tags: { #author -> 'akg'. #time -> '2022-10-27T19:02:17.492681+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '4'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method2 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method2

	^ ''This method will be saved in this session.''' stamp: 'akg 10/27/2022 19:02') to: (factory methodDefinitionSelector: #method2 className: #ATestClass meta: false package: #TestPackage protocol: #performing sourceCode: 'method2

	^ ''This method will be saved in this session.''' stamp: 'akg 10/27/2022 19:02') tags: { #author -> 'akg'. #time -> '2022-10-27T19:02:17.510646+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '1'). } asDictionary.
	factory addSessionSnapshotImageName: '/home/alistair/pharo/gt581/glamoroustoolkit/ph10/Pharo.image' tags: { #author -> 'akg'. #time -> '2022-10-27T19:02:41.005083+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #unsavedMethod className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'unsavedMethod

	^ ''This method won''''t be saved in the image''' stamp: 'akg 10/27/2022 19:03') tags: { #author -> 'akg'. #time -> '2022-10-27T19:03:03.253789+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_4mgkmwkueiwwtsdcajynbuy9p [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory modifyMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #anotherv2 sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') to: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #'as yet unclassified' sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') tags: { #author -> 'akg'. #time -> '2022-12-08T08:09:11.516217+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0' localName: '15'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936v2 meta: false package: #Issue2936v2 protocol: #anotherv2 sourceCode: 'method2

	^ 2' stamp: 'akg 12/8/2022 08:08') tags: { #author -> 'akg'. #time -> '2022-12-08T08:09:11.521941+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '1'). } asDictionary.
factory removeProtocol: #anotherv2 in: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v2''' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:09:11.52326+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '2'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2936v2 definitionSource: 'Object subclass: #Issue2936v2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #Issue2936v2' superclassName: 'Object' package: #Issue2936v2 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: 'Comment v2')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2936v2 class' definitionSource: 'Issue2936v2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T08:09:21.066618+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_4n9qze22qgvn4e0bzabuj85m3 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'AlistairGrant'. #time -> '2023-05-16T08:27:51.341614+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.19535uxejj8jyxjutgjtzbc36' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheckOld definitionSource: 'Object subclass: #GtEpEventSequencerExampleCheckOld
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheckOld class' definitionSource: 'GtEpEventSequencerExampleCheckOld class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-05-16T08:27:51.343246+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheckSub definitionSource: 'GtEpEventSequencerExampleCheckOld subclass: #GtEpEventSequencerExampleCheckSub
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleCheckOld' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheckSub class' definitionSource: 'GtEpEventSequencerExampleCheckSub class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-05-16T08:28:15.149332+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '2'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheckNew definitionSource: 'Object subclass: #GtEpEventSequencerExampleCheckNew
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheckNew class' definitionSource: 'GtEpEventSequencerExampleCheckNew class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #GtEpEventSequencerExampleCheckOld tags: { #author -> 'AlistairGrant'. #time -> '2023-05-16T08:28:26.056285+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_5u9y0py2z1sis3cufr565aovsf8ugvtlhdcakg2c6p4gkbjhu6 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'AlistairGrant'. #time -> '2023-12-02T17:35:37.661941+01:00'. #self -> (OmReference globalName: 'Issue3530-1' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.eix4y0ulc76cyertg6s4hwosj' localName: '10'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass1 definitionSource: 'Object subclass: #GtEpEventSequencerExampleClass1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass1 class' definitionSource: 'GtEpEventSequencerExampleClass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-02T17:35:37.673313+01:00'. #self -> (OmReference globalName: 'Issue3530-1' localName: '2'). #prior -> (OmReference globalName: 'Issue3530-1' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'GtEpEventSequencerExampleClass1 subclass: #GtEpEventSequencerExampleClass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleClass1' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-02T17:35:37.684128+01:00'. #self -> (OmReference globalName: 'Issue3530-1' localName: '3'). #prior -> (OmReference globalName: 'Issue3530-1' localName: '2'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'GtEpEventSequencerExampleClass1 subclass: #GtEpEventSequencerExampleClass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleClass1' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'Object subclass: #GtEpEventSequencerExampleClass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-02T17:36:08.814784+01:00'. #self -> (OmReference globalName: 'Issue3530-1' localName: '4'). #prior -> (OmReference globalName: 'Issue3530-1' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_7699qwkejd20k4j8pduw5i4uz [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #TestPackage packageName: #TestPackage tags: { #author -> 'Unknown'. #time -> '2022-10-27T19:01:00.146035+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.8hmaewksryaqf6u7g26mpahun' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #ATestClass definitionSource: 'Object subclass: #ATestClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''TestPackage''' superclassName: 'Object' package: #TestPackage packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'ATestClass class' definitionSource: 'ATestClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-10-27T19:01:00.151769+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method1

	^ ''All code changes made during this session were saved in the image.''' stamp: 'akg 10/27/2022 19:01') tags: { #author -> 'akg'. #time -> '2022-10-27T19:01:45.1495+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method1

	^ ''All code changes made during this session were saved in the image.''' stamp: 'akg 10/27/2022 19:01') to: (factory methodDefinitionSelector: #method1 className: #ATestClass meta: false package: #TestPackage protocol: #accessing sourceCode: 'method1

	^ ''All code changes made during this session were saved in the image.''' stamp: 'akg 10/27/2022 19:01') tags: { #author -> 'akg'. #time -> '2022-10-27T19:01:45.165662+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_7ub2scdz8l9kncj69r8vmyt7a [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936v5 packageName: #Issue2936v5 tags: { #author -> 'akg'. #time -> '2022-12-08T19:46:37.524874+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7isk5ycm0evkj7aiimnr5tzvq' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:46:37.525883+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:46') tags: { #author -> 'akg'. #time -> '2022-12-08T19:46:51.529985+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:46') to: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:46') tags: { #author -> 'akg'. #time -> '2022-12-08T19:46:51.555224+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:47:08.276915+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '4'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:47:13.710219+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '5'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v51 definitionSource: 'Object subclass: #Issue2936v51
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v51 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v51 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v51 class' definitionSource: 'Issue2936v51 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v5 tags: { #author -> 'akg'. #time -> '2022-12-08T19:47:27.42887+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '6'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v52 definitionSource: 'Object subclass: #Issue2936v52
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v52 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v52 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v52 class' definitionSource: 'Issue2936v52 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v51 tags: { #author -> 'akg'. #time -> '2022-12-08T19:47:35.311788+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a' localName: '7'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_7ub2scghtwapabfo48rq2rcvz [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2936v4 packageName: #Issue2936v4 tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:02.189507+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7isk5ycm0evkj7aiimnr5tzvq' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936v4 definitionSource: 'Object subclass: #Issue2936v4
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v4''' superclassName: 'Object' package: #Issue2936v4 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v4 class' definitionSource: 'Issue2936v4 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:02.193957+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '1'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v41 definitionSource: 'Object subclass: #Issue2936v41
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v4''' superclassName: 'Object' package: #Issue2936v4 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v41 class' definitionSource: 'Issue2936v41 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v4 tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:21.041429+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '2'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v41 definitionSource: 'Object subclass: #Issue2936v41
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v4''' superclassName: 'Object' package: #Issue2936v4 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v41 class' definitionSource: 'Issue2936v41 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v41 definitionSource: 'Object subclass: #Issue2936v41
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v4''' superclassName: 'Object' package: #Issue2936v4 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v41 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v41 class' definitionSource: 'Issue2936v41 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:29.929124+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '3'). } asDictionary.
	factory addCategory: #Issue2936v41 packageName: #Issue2936v41 tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:36.245879+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '4'). } asDictionary.
	factory changeBehaviorFrom: #Issue2936v4 package: nil to: 'Issue2936v41' in: ((factory classDefinitionName: #Issue2936v41 definitionSource: 'Object subclass: #Issue2936v41
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v41''' superclassName: 'Object' package: #Issue2936v41 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v41 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v41 class' definitionSource: 'Issue2936v41 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:36.297795+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '5'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936v42 definitionSource: 'Object subclass: #Issue2936v42
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v41''' superclassName: 'Object' package: #Issue2936v41 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v42 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v42 class' definitionSource: 'Issue2936v42 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T17:39:59.560794+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '6'). } asDictionary.
factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2936v42))' tags: { #author -> 'akg'. #time -> '2022-12-08T17:40:13.084886+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '7'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2936v42 definitionSource: 'Object subclass: #Issue2936v42
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: #Issue2936v41' superclassName: 'Object' package: #Issue2936v41 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #AnObsoleteIssue2936v42 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2936v42 class' definitionSource: 'Issue2936v42 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T17:40:13.116213+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '8'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v42 definitionSource: 'Object subclass: #Issue2936v42
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v41''' superclassName: 'Object' package: #Issue2936v41 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v42 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v42 class' definitionSource: 'Issue2936v42 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v41 tags: { #author -> 'akg'. #time -> '2022-12-08T17:40:24.003635+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '9'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v43 definitionSource: 'Object subclass: #Issue2936v43
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v41''' superclassName: 'Object' package: #Issue2936v41 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v43 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v43 class' definitionSource: 'Issue2936v43 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v42 tags: { #author -> 'akg'. #time -> '2022-12-08T17:40:34.004552+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz' localName: '10'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_7ub2scj0f7cllwnxa9xabtzu3 [
	| factory |

	factory := GtEpiceaEventFactory new.

factory logRedo: { (OmReference globalName: '7ub2scj3708d7o839qe13btmq' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:44.811037+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7isk5ycm0evkj7aiimnr5tzvq' localName: '1'). } asDictionary.
	factory addCategory: #Issue2936v5 packageName: #Issue2936v5 tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:44.842903+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:44.845909+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '2'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2scebtk95ngavchtkizuay' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:49.299868+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:49.347087+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '4'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2scj2dowu4336s865n8f88' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:53.252188+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue2936v5 definitionSource: 'Object subclass: #Issue2936v5
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v5 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v5 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v5 class' definitionSource: 'Issue2936v5 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-08T19:48:53.298448+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '6'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2sckd4aojxi0ev2cdprpvb' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:06.735573+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '7'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:49') tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:06.765214+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '8'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2scfegd9njko9klf9tp55x' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:10.176777+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '9'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:49') to: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:49') tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:10.204966+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '10'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:49') to: (factory methodDefinitionSelector: #method1 className: #Issue2936v5 meta: false package: #Issue2936v5 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'akg 12/8/2022 19:49') tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:10.209964+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '11'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2scd6irhur5dh2m2iek6p3' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:13.574596+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '12'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v51 definitionSource: 'Object subclass: #Issue2936v51
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v51 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v51 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v51 class' definitionSource: 'Issue2936v51 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v5 tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:13.595285+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '13'). } asDictionary.
factory logRedo: { (OmReference globalName: '7ub2scdh53k6leqf6wjet4t3o' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:17.063616+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '15'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '14'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2936v52 definitionSource: 'Object subclass: #Issue2936v52
	instanceVariableNames: ''iv1 iv2''
	classVariableNames: ''''
	package: ''Issue2936v5''' superclassName: 'Object' package: #Issue2936v5 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #iv1 className: #Issue2936v52 isMeta: false. factory instanceVariableDefinitionNamed: #iv2 className: #Issue2936v52 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2936v52 class' definitionSource: 'Issue2936v52 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2936v51 tags: { #author -> 'akg'. #time -> '2022-12-08T19:49:17.08333+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '16'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3' localName: '15'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_8j1vu2bnep000c141w9a848du [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue3399 packageName: #Issue3399 tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:51:20.643157+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.11skvudq4d3reagm08ghxovfh' localName: '23'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''a b''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:51:20.664553+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3399Subclass1 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass1 class' definitionSource: 'Issue3399Subclass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:51:35.496717+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3399Subclass2 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass2 class' definitionSource: 'Issue3399Subclass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:51:41.221217+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_8jwlh86brha0s7n2qhkh5drbe [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #methodBeforeClassDeletion className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'methodBeforeClassDeletion

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:48') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:45.504697+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx' localName: '14'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #methodBeforeClassDeletion className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #'as yet unclassified' sourceCode: 'methodBeforeClassDeletion

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:48') to: (factory methodDefinitionSelector: #methodBeforeClassDeletion className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'methodBeforeClassDeletion

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:48') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:48:51.830972+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '1'). } asDictionary.
factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2936Renamed))' tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.704331+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '2'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method1 className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method1

	^ 1' stamp: 'AlistairGrant 12/7/2022 12:45') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.87711+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '3'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method2 className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'method2

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:47') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.878315+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #renamed className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'renamed

	^ nil' stamp: 'AlistairGrant 12/7/2022 12:48') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.878911+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '5'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #methodBeforeClassDeletion className: #Issue2936Renamed meta: false package: #Issue2936 protocol: #accessing sourceCode: 'methodBeforeClassDeletion

	^ var1' stamp: 'AlistairGrant 12/7/2022 12:48') tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.879157+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '6'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2936Renamed definitionSource: 'Object subclass: #Issue2936Renamed
	instanceVariableNames: ''var1''
	classVariableNames: ''''
	package: #Issue2936' superclassName: 'Object' package: #Issue2936 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #var1 className: #AnObsoleteIssue2936Renamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2936Renamed class' definitionSource: 'Issue2936Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2022-12-07T12:49:10.879189+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe' localName: '7'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_971cu00m29881vlstap6uq2ou [
	| factory |

	factory := GtEpiceaEventFactory new.

factory logRedo: { (OmReference globalName: '971ctzv25ter9n356x2khucz2' localName: '1'). (OmReference globalName: '971ctzv25ter9n356x2khucz2' localName: '2'). }  tags: { #author -> 'Unknown'. #time -> '2022-12-17T18:07:55.667562+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx' localName: '5'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #issue2961InstanceMethod className: #Issue2961Class meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961InstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:07:58.012881+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #issue2961ClassMethod className: #'Issue2961Class class' meta: true package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961ClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:07:58.015715+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '2'). } asDictionary.
factory logRedo: { (OmReference globalName: '971ctzwz5p5mx883kai1lb1tw' localName: '1'). (OmReference globalName: '971ctzwz5p5mx883kai1lb1tw' localName: '2'). }  tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:08.050964+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #traitInstanceMethod className: #Issue2961Trait meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'traitInstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:08.066653+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '4'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #traitClassMethod className: #'Issue2961Trait classTrait' meta: true package: #Issue2961 protocol: #'as yet unclassified' sourceCode: 'traitClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:08.075046+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '5'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_9a7osa0eaojm2sck4nxhhrnwx [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue3399RootClass meta: false package: #Issue3399 protocol: #accessing sourceCode: 'method1
	^ ''1''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:53:08.155414+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''a b''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''a b c''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #c className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:53:15.779635+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #methodSubclass1 className: #Issue3399Subclass1 meta: false package: #Issue3399 protocol: #accessing sourceCode: 'methodSubclass1
	^ ''1.1''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:53:48.187883+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue3399RootClass meta: false package: #Issue3399 protocol: #accessing sourceCode: 'method1
	^ ''1''' stamp: '') to: (factory methodDefinitionSelector: #method1 className: #Issue3399RootClass meta: false package: #Issue3399 protocol: #accessing sourceCode: 'method1
	^ ''1.0''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:53:54.423706+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''a b c''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #c className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''b c''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #c className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:02.713561+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '4'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399Subclass1 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass1 class' definitionSource: 'Issue3399Subclass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399Subclass1 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass1
	instanceVariableNames: ''a''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass1 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass1 class' definitionSource: 'Issue3399Subclass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:02.846724+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399Subclass2 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass2 class' definitionSource: 'Issue3399Subclass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399Subclass2 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass2
	instanceVariableNames: ''a''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass2 class' definitionSource: 'Issue3399Subclass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:03.001939+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '6'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''b c''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #b className: #Issue3399RootClass isMeta: false. factory instanceVariableDefinitionNamed: #c className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399RootClass definitionSource: 'Object subclass: #Issue3399RootClass
	instanceVariableNames: ''c''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Object' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #c className: #Issue3399RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399RootClass class' definitionSource: 'Issue3399RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:08.92809+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '7'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399Subclass1 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass1
	instanceVariableNames: ''a''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass1 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass1 class' definitionSource: 'Issue3399Subclass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399Subclass1 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass1
	instanceVariableNames: ''a b''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass1 isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399Subclass1 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass1 class' definitionSource: 'Issue3399Subclass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:09.059322+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '8'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3399Subclass2 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass2
	instanceVariableNames: ''a''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass2 class' definitionSource: 'Issue3399Subclass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3399Subclass2 definitionSource: 'Issue3399RootClass subclass: #Issue3399Subclass2
	instanceVariableNames: ''a b''
	classVariableNames: ''''
	package: ''Issue3399''' superclassName: 'Issue3399RootClass' package: #Issue3399 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #a className: #Issue3399Subclass2 isMeta: false. factory instanceVariableDefinitionNamed: #b className: #Issue3399Subclass2 isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3399Subclass2 class' definitionSource: 'Issue3399Subclass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T13:54:09.225494+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx' localName: '9'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_Issue4477 [
	| factory |

	factory := GtEpiceaEventFactory new.

factory removeClass: ((factory classDefinitionName: #GtEpEventSequencerExamplesClass1 definitionSource: 'Object subclass: ''GtEpEventSequencerExamplesClass1''
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #GtEqEventSequencerExamplesCategory1' superclassName: 'Object' package: #GtEqEventSequencerExamplesCategory1 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteGtEpEventSequencerExamplesClass1 class' definitionSource: 'GtEpEventSequencerExamplesClass1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2025-07-16T10:05:02.997865+02:00'. #self -> (OmReference globalName: 'Issue4477' localName: '1'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-aece1b5.20F72134FE20' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExamplesClass3 definitionSource: 'GtEpEventSequencerExamplesClass2 subclass: #GtEpEventSequencerExamplesClass3
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEqEventSequencerExamplesCategory1''' superclassName: 'GtEpEventSequencerExamplesClass2' package: #GtEqEventSequencerExamplesCategory1 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExamplesClass3 class' definitionSource: 'GtEpEventSequencerExamplesClass3 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2025-07-16T10:05:15.729799+02:00'. #self -> (OmReference globalName: 'Issue4477' localName: '2'). #prior -> (OmReference globalName: 'Issue4477' localName: '1'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_RenameExport [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory registerCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'AlistairGrant'. #time -> '2024-10-09T11:01:49.104725+02:00'. #self -> (OmReference globalName: 'RenameExport' localName: '1'). #prior -> (OmReference globalName: 'Pharo11-SNAPSHOT-64bit-aece1b5.1EA40716FD68' localName: '58'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'Object subclass: #GtEpEventSequencerExampleClass2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #GtEpEventSequencerExampleClass1 tags: { #author -> 'AlistairGrant'. #time -> '2024-10-09T11:02:10.295133+02:00'. #self -> (OmReference globalName: 'RenameExport' localName: '5'). #prior -> (OmReference globalName: 'RenameExport' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #method1 className: #GtEpEventSequencerExampleClass2 meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'method1

	^ 1' stamp: 'AlistairGrant 10/9/2024 11:01') tags: { #author -> 'AlistairGrant'. #time -> '2024-10-09T11:02:15.270378+02:00'. #self -> (OmReference globalName: 'RenameExport' localName: '11'). #prior -> (OmReference globalName: 'RenameExport' localName: '10'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass2 definitionSource: 'Object subclass: ''GtEpEventSequencerExampleClass2''
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #GtEpEventSequencerExampleChecks' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteGtEpEventSequencerExampleClass2 class' definitionSource: 'GtEpEventSequencerExampleClass2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2024-10-09T11:02:15.27057+02:00'. #self -> (OmReference globalName: 'RenameExport' localName: '12'). #prior -> (OmReference globalName: 'RenameExport' localName: '11'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_a3go932rm46kbo5k07xd6d0lo [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue2924 packageName: #Issue2924 tags: { #author -> 'Unknown'. #time -> '2022-12-01T06:19:17.196027+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.9ix43guk3tb6cqha93z1wykeo' localName: '8370'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue2924 definitionSource: 'Object subclass: #Issue2924
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2924''' superclassName: 'Object' package: #Issue2924 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2924 class' definitionSource: 'Issue2924 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-01T06:19:17.197263+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method1 className: #Issue2924 meta: false package: #Issue2924 protocol: #'as yet unclassified' sourceCode: 'method1
	"Added to Issue2924.  Should be present."' stamp: 'akg 12/1/2022 06:19') tags: { #author -> 'akg'. #time -> '2022-12-01T06:19:48.755328+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method1 className: #Issue2924 meta: false package: #Issue2924 protocol: #'as yet unclassified' sourceCode: 'method1
	"Added to Issue2924.  Should be present."' stamp: 'akg 12/1/2022 06:19') to: (factory methodDefinitionSelector: #method1 className: #Issue2924 meta: false package: #Issue2924 protocol: #accessing sourceCode: 'method1
	"Added to Issue2924.  Should be present."' stamp: 'akg 12/1/2022 06:19') tags: { #author -> 'akg'. #time -> '2022-12-01T06:19:48.76935+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '3'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2924Renamed definitionSource: 'Object subclass: #Issue2924Renamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2924''' superclassName: 'Object' package: #Issue2924 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2924Renamed class' definitionSource: 'Issue2924Renamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2924 tags: { #author -> 'akg'. #time -> '2022-12-01T06:20:11.7462+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '4'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #method2 className: #Issue2924Renamed meta: false package: #Issue2924 protocol: #accessing sourceCode: 'method2
	"Added to Issue2924Renamed.  Should be present."' stamp: 'akg 12/1/2022 06:20') tags: { #author -> 'akg'. #time -> '2022-12-01T06:20:26.522813+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo' localName: '5'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_abg48fxkddb3w9179eeorg2i0 [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #methodA className: #Issue3491RootClass meta: false package: #Issue3491 protocol: #accessing sourceCode: 'methodA
	^ ''A''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:07.141876+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor' localName: '4'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #methodB className: #Issue3491SubClass meta: false package: #Issue3491 protocol: #accessing sourceCode: 'methodB
	^ ''B''' stamp: '') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:13.837625+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '1'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3491RootClass definitionSource: 'Object subclass: #Issue3491RootClass
	instanceVariableNames: ''slotA''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Object' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotA className: #Issue3491RootClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491RootClass class' definitionSource: 'Issue3491RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3491RootClass definitionSource: 'Object subclass: #Issue3491RootClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Object' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491RootClass class' definitionSource: 'Issue3491RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:18.809479+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '2'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3491SubClass definitionSource: 'Issue3491RootClass subclass: #Issue3491SubClass
	instanceVariableNames: ''slotB''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Issue3491RootClass' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3491SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491SubClass class' definitionSource: 'Issue3491SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3491SubClass definitionSource: 'Issue3491RootClass subclass: #Issue3491SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Issue3491RootClass' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3491SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3491SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491SubClass class' definitionSource: 'Issue3491SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:18.913039+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '3'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3491SubClass definitionSource: 'Issue3491RootClass subclass: #Issue3491SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Issue3491RootClass' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3491SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3491SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491SubClass class' definitionSource: 'Issue3491SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3491SubClass definitionSource: 'Object subclass: #Issue3491SubClass
	instanceVariableNames: ''slotB slotA''
	classVariableNames: ''''
	package: ''Issue3491''' superclassName: 'Object' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #slotB className: #Issue3491SubClass isMeta: false. factory instanceVariableDefinitionNamed: #slotA className: #Issue3491SubClass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3491SubClass class' definitionSource: 'Issue3491SubClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:24.877798+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #methodA className: #Issue3491RootClass meta: false package: #Issue3491 protocol: #accessing sourceCode: 'methodA
	^ ''A''' stamp: 'GlamorousAuthor 10/16/2023 13:16') tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:27.553952+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '5'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue3491RootClass definitionSource: 'Object subclass: #Issue3491RootClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #Issue3491' superclassName: 'Object' package: #Issue3491 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue3491RootClass class' definitionSource: 'Issue3491RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-10-16T13:16:27.554244+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0' localName: '6'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_aje0o0eb1zbt8670wq78g31mk [
	| factory |

	factory := GtEpiceaEventFactory new.

factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2961))' tags: { #author -> 'Unknown'. #time -> '2022-12-20T18:07:55.891837+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk' localName: '2'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2961 definitionSource: 'Object subclass: #Issue2961
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #GtEpEventSequencerExampleChecks' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2961 class' definitionSource: 'Issue2961 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-20T18:07:55.922185+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk' localName: '1'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_bf2tmewfhauyof3f6iuprs8vy [
	| factory |

	factory := GtEpiceaEventFactory new.

factory logRedo: { (OmReference globalName: 'bf2tmetf3fldbb16sr5ywn2i1' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:22.302244+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou' localName: '6'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue2961ClassRenamed definitionSource: 'Object subclass: #Issue2961ClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2961''' superclassName: 'Object' package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2961ClassRenamed class' definitionSource: 'Issue2961ClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue2961Class tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:22.311534+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '1'). } asDictionary.
factory logRedo: { (OmReference globalName: 'bf2tmeuu1sbgx57lsjz91s34g' localName: '1'). }  tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:25.798879+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '2'). } asDictionary.
	factory renameClass: ((factory traitDefinitionName: #Issue2961TraitRenamed definitionSource: 'Trait named: #Issue2961TraitRenamed
	instanceVariableNames: ''''
	package: ''Issue2961''' superclassName: #Trait package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'Issue2961TraitRenamed classTrait' definitionSource: 'Issue2961TraitRenamed classTrait
	instanceVariableNames: ''''')) from: #Issue2961Trait tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:25.800655+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_bv2k87kq4fxh8kky06axflhqu [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory modifyMethod: (factory methodDefinitionSelector: #issue2961InstanceMethod className: #Issue2961ClassRenamed meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961InstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') to: (factory methodDefinitionSelector: #issue2961InstanceMethod className: #Issue2961ClassRenamed meta: false package: #Issue2961 protocol: #'as yet unclassified' sourceCode: 'issue2961InstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:49.752557+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #issue2961InstanceMethod className: #Issue2961ClassRenamed meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961InstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:49.759295+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '1'). } asDictionary.
factory removeProtocol: #protocol1 in: ((factory classDefinitionName: #Issue2961ClassRenamed definitionSource: 'Object subclass: #Issue2961ClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2961''' superclassName: 'Object' package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue2961ClassRenamed class' definitionSource: 'Issue2961ClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:49.760146+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '2'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #issue2961ClassMethod className: #'Issue2961ClassRenamed class' meta: true package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961ClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') to: (factory methodDefinitionSelector: #issue2961ClassMethod className: #'Issue2961ClassRenamed class' meta: true package: #Issue2961 protocol: #'as yet unclassified' sourceCode: 'issue2961ClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:54.562155+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '3'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #issue2961ClassMethod className: #'Issue2961ClassRenamed class' meta: true package: #Issue2961 protocol: #protocol1 sourceCode: 'issue2961ClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:07') tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:54.569381+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '4'). } asDictionary.
factory removeProtocol: #protocol1 in: ((factory metaclassDefinitionName: #'Issue2961ClassRenamed class' definitionSource: 'Issue2961ClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new) baseClass: (factory classDefinitionName: #Issue2961ClassRenamed definitionSource: 'Object subclass: #Issue2961ClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue2961''' superclassName: 'Object' package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: ''))) tags: { #author -> 'akg'. #time -> '2022-12-17T18:08:54.570373+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '5'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #traitInstanceMethod className: #Issue2961TraitRenamed meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'traitInstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') to: (factory methodDefinitionSelector: #traitInstanceMethod className: #Issue2961TraitRenamed meta: false package: #Issue2961 protocol: #'as yet unclassified' sourceCode: 'traitInstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:04.050345+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '6'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitInstanceMethod className: #Issue2961TraitRenamed meta: false package: #Issue2961 protocol: #protocol1 sourceCode: 'traitInstanceMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:04.0719+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '7'). } asDictionary.
factory removeProtocol: #protocol1 in: ((factory traitDefinitionName: #Issue2961TraitRenamed definitionSource: 'Trait named: #Issue2961TraitRenamed
	instanceVariableNames: ''''
	package: ''Issue2961''' superclassName: #Trait package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'Issue2961TraitRenamed classTrait' definitionSource: 'Issue2961TraitRenamed classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:04.073385+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '8'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitClassMethod className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'as yet unclassified' sourceCode: 'traitClassMethod

	^ 1' stamp: 'akg 12/17/2022 18:08') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:07.859874+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '9'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_cfubabs62s0q03px5en9hhqlp [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addClass: ((factory classDefinitionName: #SubClassLevel1 definitionSource: 'SuperClassGone subclass: #SubClassLevel1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'SuperClassGone' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'SubClassLevel1 class' definitionSource: 'SubClassLevel1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-19T08:39:03.639687+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndghb4pcdebqzf2tbiw46n' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #SubClassLevel2 definitionSource: 'SubClassLevel1 subclass: #SubClassLevel2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'SubClassLevel1' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'SubClassLevel2 class' definitionSource: 'SubClassLevel2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-19T08:39:10.852683+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #SubClassLevel3 definitionSource: 'SubClassLevel2 subclass: #SubClassLevel3
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'SubClassLevel2' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'SubClassLevel3 class' definitionSource: 'SubClassLevel3 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'Unknown'. #time -> '2022-12-19T08:39:16.260721+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '2'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #instanceMethod1 className: #SubClassLevel3 meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'instanceMethod1

	^ 1' stamp: 'akg 12/19/2022 08:39') tags: { #author -> 'akg'. #time -> '2022-12-19T08:39:30.9527+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #classMethod1 className: #'SubClassLevel3 class' meta: true package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'classMethod1

	^ 1' stamp: 'akg 12/19/2022 08:39') tags: { #author -> 'akg'. #time -> '2022-12-19T08:39:40.146313+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp' localName: '4'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_cqph466cmri3r1p0t74mr0npz [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addTrait: ((factory traitDefinitionName: #TIssue2936 definitionSource: 'Trait named: #TIssue2936
	instanceVariableNames: ''''
	package: ''Issue2936v3''' superclassName: #Trait package: #Issue2936v3 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TIssue2936 classTrait' definitionSource: 'TIssue2936 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-08T11:17:34.298907+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.o7au3hl5desalskfkcw4yu49' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #tmethod1 className: #TIssue2936 meta: false package: #Issue2936v3 protocol: #'as yet unclassified' sourceCode: 'tmethod1

	^ 1' stamp: 'akg 12/8/2022 11:17') tags: { #author -> 'akg'. #time -> '2022-12-08T11:17:47.211191+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '1'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #tmethod1 className: #TIssue2936 meta: false package: #Issue2936v3 protocol: #'as yet unclassified' sourceCode: 'tmethod1

	^ 1' stamp: 'akg 12/8/2022 11:17') to: (factory methodDefinitionSelector: #tmethod1 className: #TIssue2936 meta: false package: #Issue2936v3 protocol: #accessing sourceCode: 'tmethod1

	^ 1' stamp: 'akg 12/8/2022 11:17') tags: { #author -> 'akg'. #time -> '2022-12-08T11:18:07.153695+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '2'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_d88aj31wfdp12jpe5067qrhny [
	| factory |

	factory := GtEpiceaEventFactory new.

factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2961ClassRenamed))' tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:19.643817+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu' localName: '10'). } asDictionary.
factory removeClass: ((factory classDefinitionName: #Issue2961ClassRenamed definitionSource: 'Object subclass: #Issue2961ClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: #Issue2961' superclassName: 'Object' package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'AnObsoleteIssue2961ClassRenamed class' definitionSource: 'Issue2961ClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:19.794586+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '1'). } asDictionary.
factory genericRefactoring: '(RBRemoveClassRefactoring classNames: #(#Issue2961TraitRenamed))' tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:23.914504+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '2'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #hasTraitComposition className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'hasTraitComposition
	
	^ self traitComposition isEmpty not' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.016337+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '3'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #recompile:from: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #recompilation sourceCode: 'recompile: selector from: oldClass
	"Compile the method associated with selector in the receiver''s method dictionary."

	| method newMethod |
	method := oldClass compiledMethodAt: selector.
	newMethod := self compiler
				source: (oldClass sourceCodeAt: selector);
				class: self;
				failBlock: [^ self];
				compiledMethodTrailer: method trailer;
				compile.   "Assume OK after proceed from SyntaxError"
	selector == newMethod selector ifFalse: [self error: ''selector changed!''].
	
	method properties 
		at: #traitSource 
		ifPresent: [ :aSource | newMethod propertyAt: #traitSource put: aSource].
	
	self addSelector: selector withRecompiledMethod: newMethod.' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.017059+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '4'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localSelectors className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'accessing - method dictionary' sourceCode: 'localSelectors
	
	^ self localMethodDict keys' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.017618+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '5'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #findOriginClassOf: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'findOriginClassOf: aMethod

	"I return the myself or the trait that has the original implementation of a method.
	If the method is an alias, the returned class includes the original aliased method"

	(aMethod hasProperty: #traitSource) 
		ifTrue: [ ^ aMethod traitSource innerClass ]. 

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ self ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ ^ self ]) innerClass' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.017922+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '6'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #allTraits className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #querying sourceCode: 'allTraits
	^ self traitComposition allTraits' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.018151+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '7'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitComposition: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'traitComposition: aComposition
	
	aComposition asTraitComposition allTraits do: [ :aMaybeTrait |
		aMaybeTrait isTrait ifFalse: [ 
			self error: ''All the members of the trait composition should be traits'' ]].
		
	self class baseComposition: aComposition' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.018392+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '9'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '8'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitComposition className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'traitComposition
	"My trait composition is in my class. So I do not need to recompile the methods when installing them during bootstrap"
	^ self class baseComposition' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.018626+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '10'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '9'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #fileOutLocalMethodsInCategory:on: className: #'Issue2961TraitRenamed classTrait' meta: true package: #'CodeExport-Traits' protocol: #'*CodeExport-Traits' sourceCode: 'fileOutLocalMethodsInCategory: aSymbol on: aFileStream
	| selectors |
	
	aFileStream cr.
	selectors := self selectorsToFileOutCategory: aSymbol.
		
	selectors do: [:sel | 
		((self isLocalSelector: sel) or: [ (self traitComposition selectors includes: sel) not]) ifTrue: [ 
		self printMethodChunk: sel on: aFileStream ]].
	
	^ self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.019068+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '11'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '10'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethodDict className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'localMethodDict
	"The local methodDict is in the metaclass. In this way I do not have to recompile the methods during the bootstrap when we don''t have a compiler."
	^ self class baseLocalMethods' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.019306+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '12'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '11'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traits className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'traits
	^ self traitComposition traits' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.019532+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '13'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '12'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #recategorizeSelector:from:to: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #categories sourceCode: 'recategorizeSelector: selector from: oldCategory to: newCategory
	| original |
	
	"When a method is recategorized I have to classify the method, but also recategorize the aliases pointing to it"
	
	original := self organization categoryOfElement: selector ifAbsent: [ ^ self ].

	"If it is nil is because it is a removal. It will removed when the method is removed."
	newCategory ifNil: [ ^ self ].

	original = oldCategory
		ifTrue: [ self organization classify: selector under: newCategory suppressIfDefault: true ].

	(self traitComposition reverseAlias: selector) do: [ :e | 
		self recategorizeSelector: e from: oldCategory to: newCategory. 
		self notifyOfRecategorizedSelector: e from: oldCategory to: newCategory ].
	
	self organization removeEmptyCategories' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.019788+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '14'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '13'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalMethodsProtocol: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'isLocalMethodsProtocol: aProtocol
	"Checks if the protocol has local selectors"

	aProtocol methodSelectors ifEmpty: [ ^ true ].
	^ aProtocol methodSelectors anySatisfy: [ :each | self isLocalSelector: each ]' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.020013+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '15'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '14'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #includesLocalSelector: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'includesLocalSelector: aSymbol
	^ self isLocalSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.02023+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '16'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '15'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #removeSelector: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #removing sourceCode: 'removeSelector: aSelector

	"When a selector is removed it should be notified to my users.
	Check the class TraitChange for more details"
	super removeSelector: aSelector.
	self localMethodDict removeKey: aSelector ifAbsent: [  ].

	TraitChange removeSelector: aSelector on: self.' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.020459+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '17'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '16'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addAndClassifySelector:withMethod:inProtocol: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'accessing - method dictionary' sourceCode: 'addAndClassifySelector: selector withMethod: compiledMethod inProtocol: aCategory
	
	"When a new methods is added, I add it to the localMethodDict and also propagate the changes to my users"
	self localMethodDict at: selector put: compiledMethod.
	
	super
		addAndClassifySelector: selector
		withMethod: compiledMethod
		inProtocol: aCategory.

	TraitChange addSelector: selector on: self.	' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.020799+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '18'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '17'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalSelector: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'isLocalSelector: aSelector
	
	^ self localMethodDict includesKey: aSelector' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.021019+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '19'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '18'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addSelector:withRecompiledMethod: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'accessing - method dictionary' sourceCode: 'addSelector: selector withRecompiledMethod: compiledMethod 
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"

	compiledMethod isFromTrait 
		ifTrue: [ ^ super addSelector: selector withRecompiledMethod: compiledMethod ].
	
	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withRecompiledMethod: compiledMethod.
	TraitChange addSelector: selector on: self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.021333+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '20'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '19'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethodDict: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'localMethodDict: aMethodDictionary
	^ self class baseLocalMethods: aMethodDictionary ' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.021559+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '21'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '20'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #findOriginMethodOf: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'findOriginMethodOf: aMethod

	"I return the original method for a aMethod.
	If this is a local method, the original method is itself.
	If it cames from a trait composition I look for the method in the trait composition.
	First I try with the trait stored in the traitSource. 
	If it is an aliased or conflicting method, the method is look up in the whole trait composition"

	(self includesLocalSelector: aMethod selector)
		ifTrue: [ ^ aMethod ].

	(aMethod hasProperty: #traitSource)
		ifTrue: [ |newSelector|
			newSelector := self traitComposition originSelectorOf: aMethod selector.
			^ aMethod traitSource compiledMethodAt: newSelector ifAbsent: [aMethod] ].

	^ (self traitComposition traitDefining: aMethod selector ifNone: [ self ])
		compiledMethodAt: aMethod selector ifAbsent: [ ^ aMethod ]		
' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.02182+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '22'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '21'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #removeFromComposition: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'trait-composition' sourceCode: 'removeFromComposition: aTrait

	self setTraitComposition: (self traitComposition copyWithoutTrait: aTrait asTraitComposition)' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.022076+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '23'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '22'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #addSelector:withMethod: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #'accessing - method dictionary' sourceCode: 'addSelector: selector withMethod: compiledMethod
	"When a new selector is installed in a class I insert the selector in the local methodDict and propagate the changes to my users"
	
	self localMethodDict at: selector put: compiledMethod.
	super addSelector: selector withMethod: compiledMethod.
	TraitChange addSelector: selector on: self' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.02239+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '24'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '23'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #localMethods className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'localMethods
	"returns the methods of classes excluding the ones of the traits that the class uses" 
	 
	^ self localMethodDict values' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.02262+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '25'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '24'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isAliasSelector: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'isAliasSelector: aSymbol
	"Return true if the selector aSymbol is an alias defined
	in my or in another composition somewhere deeper in 
	the tree of traits compositions."

	^ self traitComposition isAliasSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.022913+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '26'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '25'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #doRebuildMethodDictionary className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #initialization sourceCode: 'doRebuildMethodDictionary
	| selectors removedSelectors removeFromOrganization modified|

	"During the creation of the class or after a change in the traitComposition, the whole method dictionary is calculated.
	If I return true, my users should be updated"

	"1. I recreate the local methodDict"
	modified := false.
	self methodDict valuesDo: [ :m | m traitSource ifNil: [ self localMethodDict at: m selector put: m ]].

	"2. I filter the selectors from the trait composition, rejecting the ones that are locally defined.
	And then I install the methods in myself. The trait composition only install the method if it is needed."
	selectors := self traitComposition selectors reject: [ :e | (self localMethodDict includesKey: e) ].
	selectors do: [ :e | modified := modified | (self traitComposition installSelector: e into: self replacing: false)].

	"3. I handle the methods that I have and they are no more in the traitComposition."
	removedSelectors := self methodDict keys reject: [ :aSelector | (selectors includes: aSelector) or: [ self localMethodDict includesKey: aSelector] ].
	modified := modified | (removedSelectors isNotEmpty).
	removedSelectors do: [ :aSelector | self methodDict removeKey: aSelector ].

	"4. Finally, I remove these methods from my class organization"
	removeFromOrganization := self organization allMethodSelectors reject: [:e | self methodDict includesKey: e ].
	removeFromOrganization do: [ :aSelector | self organization removeElement: aSelector ].

	^ modified' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.023211+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '27'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '26'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #isLocalAliasSelector: className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #testing sourceCode: 'isLocalAliasSelector: aSymbol
	"Return true if the selector aSymbol is an alias defined
	in my trait composition."

	^ self traitComposition isLocalAliasSelector: aSymbol' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.02343+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '28'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '27'). } asDictionary.
	factory removeMethod: (factory methodDefinitionSelector: #traitCompositionString className: #'Issue2961TraitRenamed classTrait' meta: true package: #Issue2961 protocol: #accessing sourceCode: 'traitCompositionString
	^ self traitComposition asString' stamp: '') tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.023654+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '29'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '28'). } asDictionary.
factory removeTrait: ((factory traitDefinitionName: #Issue2961TraitRenamed definitionSource: 'Trait named: #Issue2961TraitRenamed
	instanceVariableNames: ''''
	package: #Issue2961' superclassName: #Trait package: #Issue2961 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'AnObsoleteIssue2961TraitRenamed classTrait' definitionSource: 'Issue2961TraitRenamed classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-17T18:09:24.023674+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '30'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny' localName: '29'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_dnu19lkupzkv1nfwrcl13b16a [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory modifyTrait: ((factory traitDefinitionName: #TIssue2936 definitionSource: 'Trait named: #TIssue2936
	instanceVariableNames: ''''
	package: ''Issue2936v3''' superclassName: #Trait package: #Issue2936v3 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TIssue2936 classTrait' definitionSource: 'TIssue2936 classTrait
	instanceVariableNames: ''''')) to: ((factory traitDefinitionName: #TIssue2936 definitionSource: 'Trait named: #TIssue2936
	instanceVariableNames: ''tvar1''
	package: ''Issue2936v3''' superclassName: #Trait package: #Issue2936v3 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TIssue2936 classTrait' definitionSource: 'TIssue2936 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-08T11:18:34.386543+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz' localName: '3'). } asDictionary.
	factory renameClass: ((factory traitDefinitionName: #TIssue2936v2 definitionSource: 'Trait named: #TIssue2936v2
	instanceVariableNames: ''tvar1''
	package: ''Issue2936v3''' superclassName: #Trait package: #Issue2936v3 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'TIssue2936v2 classTrait' definitionSource: 'TIssue2936v2 classTrait
	instanceVariableNames: ''''')) from: #TIssue2936 tags: { #author -> 'akg'. #time -> '2022-12-08T11:19:37.923447+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a' localName: '1'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_dw99fnzkfsj5zkfjgdurhacxh [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #nothingSaved className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'nothingSaved

	^ ''None of the changes in this session have been saved.''' stamp: 'akg 10/27/2022 19:03') tags: { #author -> 'akg'. #time -> '2022-10-27T19:03:39.023828+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fnzkfsj5zkfjgdurhacxh' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_dw99fo4452tx2jxn8o0zhjrzl [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #method3 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method3

	^ ''This method was saved in an image which had method2''' stamp: 'akg 10/27/2022 19:04') tags: { #author -> 'akg'. #time -> '2022-10-27T19:04:17.268283+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w' localName: '3'). } asDictionary.
	factory modifyMethod: (factory methodDefinitionSelector: #method3 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method3

	^ ''This method was saved in an image which had method2''' stamp: 'akg 10/27/2022 19:04') to: (factory methodDefinitionSelector: #method3 className: #ATestClass meta: false package: #TestPackage protocol: #'tests - test data' sourceCode: 'method3

	^ ''This method was saved in an image which had method2''' stamp: 'akg 10/27/2022 19:04') tags: { #author -> 'akg'. #time -> '2022-10-27T19:04:17.289846+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '1'). } asDictionary.
	factory addSessionSnapshotImageName: '/home/alistair/pharo/gt581/glamoroustoolkit/ph10/Pharo.image' tags: { #author -> 'akg'. #time -> '2022-10-27T19:04:21.582823+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '2'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_dw9p5j1vkn4cc2q7l08mzagby [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #Issue3398 packageName: #Issue3398 tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:51:33.114012+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.1lgzrbwayvwrjzac0ewdy0q03' localName: '20'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3398RootClass definitionSource: 'Object subclass: #Issue3398RootClass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398RootClass class' definitionSource: 'Issue3398RootClass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:51:33.148395+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #Issue3398Subclass definitionSource: 'Object subclass: #Issue3398Subclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398Subclass class' definitionSource: 'Issue3398Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:51:48.143384+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '2'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3398Subclass definitionSource: 'Object subclass: #Issue3398Subclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398Subclass class' definitionSource: 'Issue3398Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3398Subclass definitionSource: 'Issue3398RootClass subclass: #Issue3398Subclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Issue3398RootClass' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398Subclass class' definitionSource: 'Issue3398Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:51:55.24549+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '3'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #Issue3398RootClassRenamed definitionSource: 'Object subclass: #Issue3398RootClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398RootClassRenamed class' definitionSource: 'Issue3398RootClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #Issue3398RootClass tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:52:10.055183+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '5'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '4'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3398Subclass definitionSource: 'Issue3398RootClassRenamed subclass: #Issue3398Subclass
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Issue3398RootClassRenamed' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398Subclass class' definitionSource: 'Issue3398Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3398Subclass definitionSource: 'Issue3398RootClassRenamed subclass: #Issue3398Subclass
	instanceVariableNames: ''attributeA''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Issue3398RootClassRenamed' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #attributeA className: #Issue3398Subclass isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398Subclass class' definitionSource: 'Issue3398Subclass class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:52:25.854763+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '6'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '5'). } asDictionary.
	factory modifyClass: ((factory classDefinitionName: #Issue3398RootClassRenamed definitionSource: 'Object subclass: #Issue3398RootClassRenamed
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398RootClassRenamed class' definitionSource: 'Issue3398RootClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) to: ((factory classDefinitionName: #Issue3398RootClassRenamed definitionSource: 'Object subclass: #Issue3398RootClassRenamed
	instanceVariableNames: ''attributeB''
	classVariableNames: ''''
	package: ''Issue3398''' superclassName: 'Object' package: #Issue3398 packageTag: nil classVariables: OrderedCollection new instanceVariables: (OrderedCollection withAll: { factory instanceVariableDefinitionNamed: #attributeB className: #Issue3398RootClassRenamed isMeta: false}) sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'Issue3398RootClassRenamed class' definitionSource: 'Issue3398RootClassRenamed class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:52:35.841743+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '7'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '6'). } asDictionary.
	factory addSessionSnapshotImageName: '/data/GlamorousToolkit-MacOS-x86_64-v0.8.3094/GlamorousToolkit.image' tags: { #author -> 'GlamorousAuthor'. #time -> '2023-08-17T11:53:01.682012+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '8'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby' localName: '7'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_ed7mu0v17lhsys4c7p20iogap [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addCategory: #GtEpEventSequencerExampleChecks packageName: #GtEpEventSequencerExampleChecks tags: { #author -> 'AlistairGrant'. #time -> '2023-03-24T15:32:40.636646+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.cb78kh3ofjtz458j26g78id7q' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheck definitionSource: 'Object subclass: #GtEpEventSequencerExampleCheck
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheck class' definitionSource: 'GtEpEventSequencerExampleCheck class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-03-24T15:32:40.838482+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '1'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheck1 definitionSource: 'GtEpEventSequencerExampleCheck subclass: #GtEpEventSequencerExampleCheck1
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleCheck' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheck1 class' definitionSource: 'GtEpEventSequencerExampleCheck1 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-03-24T15:32:47.601129+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '2'). } asDictionary.
	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleCheck2 definitionSource: 'GtEpEventSequencerExampleCheck subclass: #GtEpEventSequencerExampleCheck2
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleCheck' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleCheck2 class' definitionSource: 'GtEpEventSequencerExampleCheck2 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-03-24T15:32:51.583012+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_em8gtmjvf6qouoyjm5tk4q4dm [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addMethod: (factory methodDefinitionSelector: #method4 className: #ATestClass meta: false package: #TestPackage protocol: #'as yet unclassified' sourceCode: 'method4

	^ ''Saving the image was the last act of the previous session.  This method will be saved.''' stamp: 'akg 10/27/2022 19:04') tags: { #author -> 'akg'. #time -> '2022-10-27T19:04:58.377739+02:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_exvcqivgnjv9mn3laofp09ze1 [
	| factory |

	factory := GtEpiceaEventFactory new.

factory logRedo: { (OmReference globalName: 'exvcqivei33mj3fm4dy56zw83' localName: '1'). (OmReference globalName: 'exvcqivei33mj3fm4dy56zw83' localName: '2'). (OmReference globalName: 'exvcqivei33mj3fm4dy56zw83' localName: '3'). }  tags: { #author -> 'Unknown'. #time -> '2022-12-18T17:29:57.592118+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.2adndgkee0bu7u0o5pnc07pla' localName: '3'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #traitInstanceMethod1 className: #Trait2961 meta: false package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'traitInstanceMethod1

	^ 1' stamp: 'akg 12/18/2022 17:29') tags: { #author -> 'akg'. #time -> '2022-12-18T17:29:59.926885+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '2'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '1'). } asDictionary.
	factory addMethod: (factory methodDefinitionSelector: #traitClassMethod1 className: #'Trait2961 classTrait' meta: true package: #GtEpEventSequencerExampleChecks protocol: #'as yet unclassified' sourceCode: 'traitClassMethod1

	^ 1' stamp: 'akg 12/18/2022 17:29') tags: { #author -> 'akg'. #time -> '2022-12-18T17:29:59.929488+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '3'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '2'). } asDictionary.
	factory modifyTrait: ((factory traitDefinitionName: #Trait2961 definitionSource: 'Trait named: #Trait2961
	instanceVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: #Trait package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'Trait2961 classTrait' definitionSource: 'Trait2961 classTrait
	instanceVariableNames: ''''')) to: ((factory traitDefinitionName: #Trait2961 definitionSource: 'Trait named: #Trait2961
	instanceVariableNames: ''iv1''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: #Trait package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metatraitDefinitionName: #'Trait2961 classTrait' definitionSource: 'Trait2961 classTrait
	instanceVariableNames: ''''')) tags: { #author -> 'akg'. #time -> '2022-12-18T17:29:59.942029+01:00'. #self -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '4'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1' localName: '3'). } asDictionary.

	^ factory

]

{ #category : #'example events' }
GtEpiceaExampleOmbuFiles class >> ombu_kl93xmyxa83xq55wcrbwgz13bjqqnkh4e19d8h19x9yaxxekt [
	| factory |

	factory := GtEpiceaEventFactory new.

	factory addClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass3 definitionSource: 'GtEpEventSequencerExampleClass1 subclass: #GtEpEventSequencerExampleClass3
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'GtEpEventSequencerExampleClass1' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass3 class' definitionSource: 'GtEpEventSequencerExampleClass3 class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:19:02.030857+01:00'. #self -> (OmReference globalName: 'Issue3529-2' localName: '1'). #prior -> (OmReference globalName: 'Pharo10-SNAPSHOT-64bit-179ef65.8ftsg0rrv7ryjkxcdpvo5fxk' localName: '7'). } asDictionary.
	factory renameClass: ((factory classDefinitionName: #GtEpEventSequencerExampleClass1rename definitionSource: 'Object subclass: #GtEpEventSequencerExampleClass1rename
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''GtEpEventSequencerExampleChecks''' superclassName: 'Object' package: #GtEpEventSequencerExampleChecks packageTag: nil classVariables: OrderedCollection new instanceVariables: OrderedCollection new sharedPools: OrderedCollection new comment: (factory classComment: '')) withMetaclass: (factory metaclassDefinitionName: #'GtEpEventSequencerExampleClass1rename class' definitionSource: 'GtEpEventSequencerExampleClass1rename class
	instanceVariableNames: ''''' instanceVariables: OrderedCollection new)) from: #GtEpEventSequencerExampleClass1 tags: { #author -> 'AlistairGrant'. #time -> '2023-12-01T12:19:15.134036+01:00'. #self -> (OmReference globalName: 'Issue3529-2' localName: '2'). #prior -> (OmReference globalName: 'Issue3529-2' localName: '1'). } asDictionary.

	^ factory

]

{ #category : #initialization }
GtEpiceaExampleOmbuFiles class >> reset [

	DataDir := nil
]

{ #category : #accessing }
GtEpiceaExampleOmbuFiles >> dataDir [

	^ DataDir ifNil: [ self loadDataDir ]
]

{ #category : #private }
GtEpiceaExampleOmbuFiles >> load: pathString fromEntries: aCollection [
	| fileReference |

	fileReference := DataDir / pathString.
	fileReference parent ensureCreateDirectory.
	fileReference writeStreamDo: [ :wStream |
		aCollection do: [ :epEvent |
			STON put: epEvent onStreamPretty: wStream ] ].
]

{ #category : #private }
GtEpiceaExampleOmbuFiles >> loadDataDir [

	DataDir := self newMemoryFileSystem.
	{
	'GtEpEventSequencerExamples/Issue4080/RenameExport.ombu' -> self class ombu_RenameExport entries.
	'GtEpEventSequencerExamples/Issue3399/Pharo10-SNAPSHOT-64bit-179ef65.9a7osa0eaojm2sck4nxhhrnwx.ombu' -> self class ombu_9a7osa0eaojm2sck4nxhhrnwx entries.
	'GtEpEventSequencerExamples/Issue2936-8/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgjmtcjlis884c9ofhcmo.ombu' -> self class ombu_2adndgjmtcjlis884c9ofhcmo entries.
	'GtEpEventSequencerExamples/Issue2936-2/Pharo10-SNAPSHOT-64bit-2314c3f.4mgkmwkueiwwtsdcajynbuy9p.ombu' -> self class ombu_4mgkmwkueiwwtsdcajynbuy9p entries.
	'GtEpEventSequencerExamples/Issue2936-2/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnxe4socg0.ombu' -> self class ombu_2adndgfj165q3dvmnxe4socg0 entries.
	'GtEpEventSequencerExamples/Issue3420/Pharo11-SNAPSHOT-64bit-53659ed.3D1E2A5A5F98.ombu' -> self class ombu_3D1E2A5A5F98 entries.
	'GtEpEventSequencerExamples/Issue2936-5/Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scdz8l9kncj69r8vmyt7a.ombu' -> self class ombu_7ub2scdz8l9kncj69r8vmyt7a entries.
	'GtEpEventSequencerExamples/Issue2936-5/Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scj0f7cllwnxa9xabtzu3.ombu' -> self class ombu_7ub2scj0f7cllwnxa9xabtzu3 entries.
	'GtEpEventSequencerExamples/Issue3491/Pharo10-SNAPSHOT-64bit-179ef65.abg48fxkddb3w9179eeorg2i0.ombu' -> self class ombu_abg48fxkddb3w9179eeorg2i0 entries.
	'GtEpEventSequencerExamples/Issue2936-6/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vu0od07o9f.ombu' -> self class ombu_2adndgi1mh7mez3vu0od07o9f entries.
	'GtEpEventSequencerExamples/Issue2958/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgempmdk8mj0pwknbzd68.ombu' -> self class ombu_2adndgempmdk8mj0pwknbzd68 entries.
	'GtEpEventSequencerExamples/Issue3529/Issue3529-2.ombu' -> self class ombu_kl93xmyxa83xq55wcrbwgz13bjqqnkh4e19d8h19x9yaxxekt entries.
	'GtEpEventSequencerExamples/Issue3529/Issue3529-1.ombu' -> self class ombu_3fkffmpy2gp0kuve9ssl19c3k29tr1g47dv2aki9eb738drdhe entries.
	'GtEpEventSequencerExamples/Issue2936/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfj165q3dvmnwi5wohpx.ombu' -> self class ombu_2adndgfj165q3dvmnwi5wohpx entries.
	'GtEpEventSequencerExamples/Issue2936/Pharo10-SNAPSHOT-64bit-2314c3f.8jwlh86brha0s7n2qhkh5drbe.ombu' -> self class ombu_8jwlh86brha0s7n2qhkh5drbe entries.
	'GtEpEventSequencerExamples/Issue3530/Issue3530-1.ombu' -> self class ombu_5u9y0py2z1sis3cufr565aovsf8ugvtlhdcakg2c6p4gkbjhu6 entries.
	'GtEpEventSequencerExamples/Issue2961-3/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgfuoq0bg86t1y9x6ssxk.ombu' -> self class ombu_2adndgfuoq0bg86t1y9x6ssxk entries.
	'GtEpEventSequencerExamples/Issue2961-3/Pharo10-SNAPSHOT-64bit-2314c3f.aje0o0eb1zbt8670wq78g31mk.ombu' -> self class ombu_aje0o0eb1zbt8670wq78g31mk entries.
	'GtEpEventSequencerExamples/Issue2936-4/Pharo10-SNAPSHOT-64bit-2314c3f.7ub2scghtwapabfo48rq2rcvz.ombu' -> self class ombu_7ub2scghtwapabfo48rq2rcvz entries.
	'GtEpEventSequencerExamples/Issue3487/Pharo10-SNAPSHOT-64bit-179ef65.3dsjiizgjzilekro4fb7a5dr4.ombu' -> self class ombu_3dsjiizgjzilekro4fb7a5dr4 entries.
	'GtEpEventSequencerExamples/Issue2936-3/Pharo10-SNAPSHOT-64bit-2314c3f.3di355b76zwcwynp2ykcbwwew.ombu' -> self class ombu_3di355b76zwcwynp2ykcbwwew entries.
	'GtEpEventSequencerExamples/Issue2936-3/Pharo10-SNAPSHOT-64bit-2314c3f.dnu19lkupzkv1nfwrcl13b16a.ombu' -> self class ombu_dnu19lkupzkv1nfwrcl13b16a entries.
	'GtEpEventSequencerExamples/Issue2936-3/Pharo10-SNAPSHOT-64bit-2314c3f.cqph466cmri3r1p0t74mr0npz.ombu' -> self class ombu_cqph466cmri3r1p0t74mr0npz entries.
	'GtEpEventSequencerExamples/Issue2936-9/Pharo10-SNAPSHOT-64bit-2314c3f.2adndghvsp9xw8sezhqi6xatq.ombu' -> self class ombu_2adndghvsp9xw8sezhqi6xatq entries.
	'GtEpEventSequencerExamples/Issue3398/Pharo10-SNAPSHOT-64bit-179ef65.dw9p5j1vkn4cc2q7l08mzagby.ombu' -> self class ombu_dw9p5j1vkn4cc2q7l08mzagby entries.
	'GtEpEventSequencerExamples/Issue2961-2/Pharo10-SNAPSHOT-64bit-2314c3f.cfubabs62s0q03px5en9hhqlp.ombu' -> self class ombu_cfubabs62s0q03px5en9hhqlp entries.
	'GtEpEventSequencerExamples/Issue2961-2/Pharo10-SNAPSHOT-64bit-2314c3f.3699hxpexw9en86vig1dlpbso.ombu' -> self class ombu_3699hxpexw9en86vig1dlpbso entries.
	'GtEpEventSequencerExamples/Issue2936-7/Pharo10-SNAPSHOT-64bit-2314c3f.1xu8qmkzudqml7bedqwpy26cf.ombu' -> self class ombu_1xu8qmkzudqml7bedqwpy26cf entries.
	'GtEpEventSequencerExamples/Issue2924/Pharo10-SNAPSHOT-64bit-f72dfb7.a3go932rm46kbo5k07xd6d0lo.ombu' -> self class ombu_a3go932rm46kbo5k07xd6d0lo entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.bv2k87kq4fxh8kky06axflhqu.ombu' -> self class ombu_bv2k87kq4fxh8kky06axflhqu entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.971cu00m29881vlstap6uq2ou.ombu' -> self class ombu_971cu00m29881vlstap6uq2ou entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgh5axfgk7r9vz60o6ajx.ombu' -> self class ombu_2adndgh5axfgk7r9vz60o6ajx entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.bf2tmewfhauyof3f6iuprs8vy.ombu' -> self class ombu_bf2tmewfhauyof3f6iuprs8vy entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.d88aj31wfdp12jpe5067qrhny.ombu' -> self class ombu_d88aj31wfdp12jpe5067qrhny entries.
	'GtEpEventSequencerExamples/Issue2961/Pharo10-SNAPSHOT-64bit-2314c3f.exvcqivgnjv9mn3laofp09ze1.ombu' -> self class ombu_exvcqivgnjv9mn3laofp09ze1 entries.
	'GtEpEventSequencerExamples/Issue4477/Issue4477.ombu' -> self class ombu_Issue4477 entries.
	'GtEpEventSequencerExamples/Issue3259/Pharo10-SNAPSHOT-64bit-179ef65.4n9qze22qgvn4e0bzabuj85m3.ombu' -> self class ombu_4n9qze22qgvn4e0bzabuj85m3 entries.
	'GtEpEventSequencerExamples/Issue3490/Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok3zaoyvu.ombu' -> self class ombu_3bak9h9f6v0rt870ok3zaoyvu entries.
	'GtEpEventSequencerExamples/Issue2991/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgi1mh7mez3vuyyeo7oxr.ombu' -> self class ombu_2adndgi1mh7mez3vuyyeo7oxr entries.
	'GtEpEventSequencerExamples/Issue3171/Pharo10-SNAPSHOT-64bit-14f5413.ed7mu0v17lhsys4c7p20iogap.ombu' -> self class ombu_ed7mu0v17lhsys4c7p20iogap entries.
	'GtEpEventSequencerExamples/Issue3399/initial/Pharo10-SNAPSHOT-64bit-179ef65.8j1vu2bnep000c141w9a848du.ombu' -> self class ombu_8j1vu2bnep000c141w9a848du entries.
	'GtEpEventSequencerExamples/Issue3491/initial/Pharo10-SNAPSHOT-64bit-179ef65.3bak9h9f6v0rt870ok8lrvvor.ombu' -> self class ombu_3bak9h9f6v0rt870ok8lrvvor entries.
	'GtEpLogEnumeratorExamples/testTrait2/Pharo10-SNAPSHOT-64bit-fec28a6.313x18caa4oyvcekylktb7i4k.ombu' -> self class ombu_313x18caa4oyvcekylktb7i4k entries.
	'GtEpLogEnumeratorExamples/testClass01/Pharo10-SNAPSHOT-64bit-fec28a6.dw99fo4452tx2jxn8o0zhjrzl.ombu' -> self class ombu_dw99fo4452tx2jxn8o0zhjrzl entries.
	'GtEpLogEnumeratorExamples/testClass01/Pharo10-SNAPSHOT-64bit-fec28a6.dw99fnzkfsj5zkfjgdurhacxh.ombu' -> self class ombu_dw99fnzkfsj5zkfjgdurhacxh entries.
	'GtEpLogEnumeratorExamples/testClass01/Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm.ombu' -> self class ombu_em8gtmjvf6qouoyjm5tk4q4dm entries.
	'GtEpLogEnumeratorExamples/testClass01/Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz.ombu' -> self class ombu_7699qwkejd20k4j8pduw5i4uz entries.
	'GtEpLogEnumeratorExamples/testClass01/Pharo10-SNAPSHOT-64bit-fec28a6.4i0wvlvo02nxps5csied8ix6w.ombu' -> self class ombu_4i0wvlvo02nxps5csied8ix6w entries.
	'GtEpReplayModelExamples/data01/Pharo10-SNAPSHOT-64bit-2314c3f.2adndgji2gjod2o288oibtkgo.ombu' -> self class ombu_2adndgji2gjod2o288oibtkgo entries.
	} do: [ :assoc |
		self load: assoc key fromEntries: assoc value ].
	^ DataDir

]

{ #category : #initialization }
GtEpiceaExampleOmbuFiles >> newMemoryFileSystem [

	^ FileSystem memory root
]
