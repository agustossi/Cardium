actions
moveTile: aTile onABoardOf: numberOfTiles 
	tile:= tile + aTile.
	round:= round + (tile // numberOfTiles).
	tile := tile % numberOfTiles.
	tile == 0 ifTrue:[tile := numberOfTiles]