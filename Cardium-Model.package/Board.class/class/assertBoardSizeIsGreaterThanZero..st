instance creation
assertBoardSizeIsGreaterThanZero: size
	size <= 0
		ifTrue: [ GameError signal: 'board size must be greater than 0' ]