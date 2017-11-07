tests
testWhenCalculatingToMoveOneTileFromPositionZeroTileIsOneSumOfTilesIsOneAndRoundIsZero
	
	| positionCalculator anEffectlesTile boardGenerator board |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	self assert: (positionCalculator calculateNewSumOfTilesUsing: 0 havingThisNew: 1) equals: 1;
		  assert: (positionCalculator calculateNewTileUsing: 0 inThis: board  havingThisNew: 1) equals: 1;
		  assert: (positionCalculator calculateNewRoundUsing: 1 inThis: board) equals: 0.
	 