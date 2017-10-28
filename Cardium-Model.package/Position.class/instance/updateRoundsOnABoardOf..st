actions
updateRoundsOnABoardOf: numberOfTiles 	
	totalTiles<0 
	ifFalse: [ tile := totalTiles % numberOfTiles. ] 
	ifTrue: [ tile:= totalTiles % ( numberOfTiles * (-1) )].
	round:= (totalTiles // numberOfTiles).
	((tile == 0) and:  (lastTiles ~~ 0)) ifTrue:[tile := numberOfTiles]