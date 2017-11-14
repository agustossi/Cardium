calculating
calculateNewRoundUsing: aSumOfTiles inThis: board 
	| boardSize |
	boardSize := board numberOfTiles.	
	^ (aSumOfTiles // boardSize).
	