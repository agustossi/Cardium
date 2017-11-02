as yet unclassified
calculateNewRoundUsing: aHistory inThis: aBoard 
	| boardSize totalTiles |
	boardSize := aBoard numberOfTiles.
	totalTiles := 0.
	totalTiles := aHistory sumNumbers: [ :p | p  ].	
	^ (totalTiles // boardSize).
	