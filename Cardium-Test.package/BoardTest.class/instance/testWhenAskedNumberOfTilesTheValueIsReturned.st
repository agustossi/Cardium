tests
testWhenAskedNumberOfTilesTheValueIsReturned
	
	| board |
	board:= Board ofSize: 100.
	Transcript show: board.
	self assert: board numberOfTiles equals: 100.