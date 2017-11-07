tests
testWhenSizeIsZeroOrLowerAnErrorOccurs
	self
		should: [ Board ofSize: 0 withThisGenerator: TileRandomGenerator new]
		raise: GameError withExceptionDo: [:signal | self assert: signal messageText equals: 'board size must be greater than 0']..