accessing
assertShouldBeGreaterThanZero: numberOfFaces
	numberOfFaces <= 0
		ifTrue: [ GameError signal: 'The number of faces should be greater than 0' ]