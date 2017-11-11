accessing
faces: aNumberOfFaces
	self assertShouldBeGreaterThanZero: aNumberOfFaces.
	^ (self faces: aNumberOfFaces rollingFrom: (Random new)).