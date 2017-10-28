tests
testWhenPositionIsCreatedTileIsZeroRoundIsZeroLastTileIsZero

	| position |
	position:= Position moving: 0 from: 0 onABoardOf: 10.
	self assert: position tile equals: 0.
	self assert: position rounds equals: 0.
	self assert: position lastTiles equals:0.