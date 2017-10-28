tests
testWhenTilesToMoveEqualsTheSizeOfTheBoardStartingFromZeroLastTileEqualsZeroRoundEqualsOneTileEqualsZero

	| position |
	position:= Position moving: 10 from: 0 onABoardOf: 10.
	self assert: position tile equals: 10.
	self assert: position rounds equals: 1.
	self assert: position lastTiles equals:0.