tests
testCreationOfABoardPosition
	| boardPosition |
	boardPosition := BoardPosition tile: 0 totalTiles: 0 round: 0.
	self
		assert: boardPosition tiles equals: 0;
		assert: boardPosition rounds equals: 0;
		assert: boardPosition totalTiles equals: 0.