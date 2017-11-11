asserting
assertShouldNotBeEmpty: aName
	aName isEmpty
		ifTrue: [ GameError signal: 'The name shouldnt be empty' ]