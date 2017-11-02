tests
testWhenGoingBackwardsAfterCompletingARoundTheRoundIsDecreasedInOneIfTilePositionIsLowerThanBoardSize

	| positionCalculator anEffectlesTile boardGenerator board |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	self assert: (positionCalculator calculateNewPositionUsing: 14 havingThisNew: -5) equals: 9;
		  assert: (positionCalculator calculateNewPositionUsing: 4 inThis: board  havingThisNew: -5) equals: 9;
		  assert: (positionCalculator calculateNewRoundUsing: 9 inThis: board) equals: 0.
	 