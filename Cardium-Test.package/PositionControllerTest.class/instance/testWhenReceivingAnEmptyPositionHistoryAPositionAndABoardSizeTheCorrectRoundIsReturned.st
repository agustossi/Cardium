tests
testWhenReceivingAnEmptyPositionHistoryAPositionAndABoardSizeTheCorrectRoundIsReturned
	
	|positionCalculator aHistory anEffectlesTile boardGenerator board updatedRound |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	aHistory := OrderedCollection new.
	aHistory add: 9.
	aHistory add: 10.	
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.	
	updatedRound := positionCalculator calculateNewRoundUsing: aHistory inThis: board.
	self assert: updatedRound equals: 1.