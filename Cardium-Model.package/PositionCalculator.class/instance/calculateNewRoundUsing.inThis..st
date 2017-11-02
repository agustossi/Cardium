as yet unclassified
calculateNewRoundUsing: aSumOfTiles inThis: board 
	| boardSize |
	boardSize := board numberOfTiles.	
	^ (aSumOfTiles // boardSize).
	