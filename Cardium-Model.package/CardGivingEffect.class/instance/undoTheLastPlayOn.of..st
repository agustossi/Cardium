affecting
undoTheLastPlayOn: aGame of: aPlayer 
	
	aGame removeLastDecksCardOf: aPlayer.
	aGame addLastTile: (UndoEffect new).