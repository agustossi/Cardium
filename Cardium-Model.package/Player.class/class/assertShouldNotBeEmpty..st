asserting
assertShouldNotBeEmpty: aName
	aName isEmpty
		ifTrue: [ Error signal: 'The name shouldnt be empty' ]