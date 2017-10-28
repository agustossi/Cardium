tests
testWhenAskedNumberOfTilesTheValueIsReturned
	
	| board |
	board:= Board ofSize: 100.
	self assert: board numberOfTiles equals: 100.