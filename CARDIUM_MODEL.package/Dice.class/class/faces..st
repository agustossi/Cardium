accessing
faces: numberOfFaces
	self assertShouldBeGreaterThanZero: numberOfFaces.
	^ self new initialize: numberOfFaces