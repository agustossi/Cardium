instance creation
assertBoardSizeIsGreaterThanZero: size
	size <= 0
		ifTrue: [ Error signal: 'board size must be greater than 0' ]