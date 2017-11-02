tests
testWhenReceivingAnEmptyPositionHistoryAPositionAndABoardSizeTheCorrectPositionIsReturned
	
	|positionCalculator aHistory position anEffectlesTile boardGenerator board lastItemIndex currentPosition updatedHistoryPosition |
	positionCalculator := PositionCalculator new.
	anEffectlesTile := Effectles new.
	aHistory := OrderedCollection new.
	aHistory add: 0.
	position:= 1.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator .	
	lastItemIndex := aHistory size.
	currentPosition := aHistory at: lastItemIndex.
	updatedHistoryPosition := positionCalculator calculateNewPositionUsing: currentPosition inThis: board havingThisNew: 	position.
	self assert: updatedHistoryPosition equals: 1.