Class {
	#name : #GtEpLogEnumeratorExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit4Epicea-Examples'
}

{ #category : #enumerating }
GtEpLogEnumeratorExamples >> entriesFromStartTo [
	"Demonstrate retrieving all a subset of entries"
	<gtExample>
	| entries epLog start end reference |

	epLog := GtEpLogEnumerator fromFile: self testDataRoot / 'testClass01' / 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm.ombu'.
	start := (epLog priorEntriesFromHead reversed at: 2) tagAt: #self.
	end := (epLog priorEntriesFromHead reversed last) tagAt: #self.
	entries := epLog entriesFrom: start to: end.
	self assert: entries size equals: 9.
	reference := entries first tagAt: #self.
	self assert: reference localName equals: '1'.
	self assert: reference globalName equals: 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm'.
	reference := entries last tagAt: #self.
	self assert: reference localName equals: '3'.
	self assert: reference globalName equals: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz'.
]

{ #category : #enumerating }
GtEpLogEnumeratorExamples >> priorEntriesFromHead [
	"Demonstrate retrieving all entries from the head reference"
	<gtExample>
	| entries epLog reference |

	epLog := GtEpLogEnumerator fromFile: self testDataRoot / 'testClass01' / 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm.ombu'.
	entries := epLog priorEntriesFromHead.
	self assert: entries size equals: 11.
	reference := entries first tagAt: #self.
	self assert: reference localName equals: '1'.
	self assert: reference globalName equals: 'Pharo10-SNAPSHOT-64bit-fec28a6.em8gtmjvf6qouoyjm5tk4q4dm'.
	reference := entries last tagAt: #self.
	self assert: reference localName equals: '1'.
	self assert: reference globalName equals: 'Pharo10-SNAPSHOT-64bit-fec28a6.7699qwkejd20k4j8pduw5i4uz'.
]

{ #category : #'private - helpers' }
GtEpLogEnumeratorExamples >> testDataRoot [

	^ (IceRepository registeredRepositoryIncludingPackage: self class package) location / 'test' / self class name.
]
