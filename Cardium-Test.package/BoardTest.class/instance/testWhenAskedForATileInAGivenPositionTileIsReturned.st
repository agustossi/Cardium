tests
testWhenAskedForATileInAGivenPositionTileIsReturned
	| generator board effectles |
	effectles:=Effectles new.
	generator:= TileFixedGenerator using: effectles.
	board:= Board ofSize: 8 withThisGenerator: generator.
	self assert: (board tileAtPosition: 2) equals: effectles.