tests
testWhenARoundIsCompleteTileEqualsBoardSizeAndRoundEqualsOne

	| position |
	position:= Position moving: 0 from: 0 onABoardOf: 10.
	self assert: position tile equals: 0.
	self assert: position rounds equals: 0.
	self assert: position lastTiles equals:0.
	position:= Position moving: 5 from: 0 onABoardOf: 10.
	self assert: position tile equals: 5.
	self assert: position rounds equals: 0.
	self assert: position lastTiles equals:0.
	position:= Position moving: 5 from: 5 onABoardOf: 10.
	self assert: position tile equals: 10.
	self assert: position rounds equals: 1.
	self assert: position lastTiles equals:5.