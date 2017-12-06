tests
testWhenGoingBackwardsAfterCompletingARoundTheRoundIsDecreasedInOneIfTilePositionIsLowerThanBoardSize

	| positionCalculator anEffectlesTile boardGenerator board oldPosition newPosition |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	oldPosition := BoardPosition tile: 0 totalTiles: 0  round: 0. 
	newPosition := positionCalculator calculateNewPositionUsing: oldPosition inThis: board  havingThisNew: 12. 
	self assert: (newPosition tiles) equals:2;
		  assert: (newPosition rounds) equals:1;
		  assert: (newPosition totalTiles) equals:12.	 
	newPosition := positionCalculator calculateNewPositionUsing: newPosition inThis: board  havingThisNew: -4. 
	self assert: (newPosition tiles) equals:8;
		  assert: (newPosition rounds) equals:0;
		  assert: (newPosition totalTiles) equals:8.	 