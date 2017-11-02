accessing
tile
	| tile |	
	totalTiles < 0 
	ifFalse: [ tile := totalTiles % boardSize. ] 
	ifTrue: [ tile := totalTiles % ( boardSize * (-1) )].
	((tile == 0) and:  (totalTiles ~~ 0)) ifTrue:[tile := boardSize ].	
	^ tile