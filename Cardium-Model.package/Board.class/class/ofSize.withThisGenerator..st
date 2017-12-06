instance creation
ofSize: size withThisGenerator: aTileGenerator
	self assertSizeIsGreaterThanZero: size.
	^ self new initializeBoardSize: size initilizeGenerator: aTileGenerator 