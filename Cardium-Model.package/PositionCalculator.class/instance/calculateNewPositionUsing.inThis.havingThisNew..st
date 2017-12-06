calculating
calculateNewPositionUsing: currentPosition inThis: aBoard havingThisNew: position
	
	| oldSumOfTiles newTile newSumOfTiles newRound|
	oldSumOfTiles := currentPosition totalTiles.	
	newTile := self  calculateNewTileUsing: oldSumOfTiles  inThis: aBoard  havingThisNew: position.
	newSumOfTiles:=  oldSumOfTiles + position.
	newRound:= self calculateNewRoundUsing: newSumOfTiles inThis: aBoard.
	^ (BoardPosition tile: newTile totalTiles: newSumOfTiles round: newRound).
	


   

    