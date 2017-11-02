tests
testWhenReceivingAnEmptyPositionHistoryAPositionAndABoardSizeTheCorrectPositionIsReturned
	
	|positionController aHistory position anEffectlesTile boardGenerator board |
	positionController := PositionCalculator new.
	aHistory := OrderedCollection new.
	position:= 1.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator .
	positionController calculateUsing: aHistory inThis: board havingThisNew: position.