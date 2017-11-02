instance creation
ofSize: size withThisGenerator: aTileGenerator
	self assertBoardSizeIsGreaterThanZero: size.
	^ self new initializeBoardSize: size initilizeGenerator: aTileGenerator 