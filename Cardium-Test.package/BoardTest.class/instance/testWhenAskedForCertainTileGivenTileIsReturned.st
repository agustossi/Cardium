tests
testWhenAskedForCertainTileGivenTileIsReturned
	
	| board aTile |
	board:= Board ofSize: 100.
	aTile:=board tileAtPosition: 5.
	Transcript show: aTile.
	