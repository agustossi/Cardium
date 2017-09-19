tests
testWhenAskedForTheTileIntCertainIndexTheIdOfThatTileIsReturned
	
	| board |
	board:= Board ofSize: 1.
	self assert: board numberOfTiles equals: 1.