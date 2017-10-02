accessing
assertShouldBeGreaterThanZero: numberOfFaces
	numberOfFaces <= 0
		ifTrue: [ Error signal: 'The number of faces should be greater than 0' ]