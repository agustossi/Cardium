instance creation
ofSize: size
	self assertBoardSizeIsGreaterThanZero: size.
	^ self new initializeBoardSize: size