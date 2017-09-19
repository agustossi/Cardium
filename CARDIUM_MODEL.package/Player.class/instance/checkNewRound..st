actions
checkNewRound: numberOfTiles 
	round:=round + (position // numberOfTiles).
	position := position % numberOfTiles.