tests
testWhenGoingBackwardsAfterCompletingARoundTheRoundIsDecreasedInOneIfTilePositionIsLowerThanBoardSize

	| position |
	position:= Position moving: 0 from: 0 onABoardOf: 10.
	self assert: position tile equals: 0.
	self assert: position rounds equals: 0.
	self assert: position lastTiles equals:0.
	position:= Position moving: 10 from: 0 onABoardOf: 10.
	self assert: position tile equals: 10.
	self assert: position rounds equals: 1.
	self assert: position lastTiles equals:0.
	position:= Position moving: 4 from: 10 onABoardOf: 10.
	self assert: position tile equals: 4.
	self assert: position rounds equals: 1.
	self assert: position lastTiles equals:10.
	position:= Position moving: -5 from: 14 onABoardOf: 10.
	self assert: position tile equals: 9.
	self assert: position rounds equals: 0.
	self assert: position lastTiles equals:14.
	