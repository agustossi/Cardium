tests
testWhenGoingBackwardsAfterCompletingARoundTheRoundIsDecreasedInOneIfTilePositionIsLowerThanBoardSize

	| positionCalculator anEffectlesTile boardGenerator board |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	self assert: (positionCalculator calculateNewSumOfTilesUsing: 14 havingThisNew: -5) equals: 9;
		  assert: (positionCalculator calculateNewTileUsing: 4 inThis: board  havingThisNew: -5) equals: 9;
		  assert: (positionCalculator calculateNewRoundUsing: 9 inThis: board) equals: 0.
	 