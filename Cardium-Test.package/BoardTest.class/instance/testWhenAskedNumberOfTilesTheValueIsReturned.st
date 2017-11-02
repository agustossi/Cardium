tests
testWhenAskedNumberOfTilesTheValueIsReturned
	| board |
	board := Board ofSize: 100 withThisGenerator: (TileRandomGenerator new).
	self assert: board numberOfTiles equals: 100