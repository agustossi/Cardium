as yet unclassified
calculateNewPositionUsing: currentPosition inThis: aBoard havingThisNew: position
	
	
	|oldTile oldSumOfTiles newTile newSumOfTiles newRound|
	oldTile := currentPosition tiles.
	oldSumOfTiles := currentPosition totalTiles.	
	
	newTile := self  calculateNewTileUsing: oldSumOfTiles  inThis: aBoard  havingThisNew: position.
	newSumOfTiles:= self calculateNewSumOfTilesUsing: oldSumOfTiles havingThisNew: position.
	newRound:= self calculateNewRoundUsing: newSumOfTiles inThis: aBoard.
	
	^ (BoardPosition tile: newTile totalTiles: newSumOfTiles round: newRound).
	


   

    