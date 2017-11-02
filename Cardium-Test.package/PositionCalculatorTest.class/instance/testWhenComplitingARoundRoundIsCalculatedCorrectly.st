tests
testWhenComplitingARoundRoundIsCalculatedCorrectly

	| positionCalculator anEffectlesTile boardGenerator board |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	self assert: (positionCalculator calculateNewPositionUsing: 9 havingThisNew: 1) equals: 10;
		  assert: (positionCalculator calculateNewPositionUsing: 9 inThis: board  havingThisNew: 1) equals: 10;
		  assert: (positionCalculator calculateNewRoundUsing: 10 inThis: board) equals: 1.
	 