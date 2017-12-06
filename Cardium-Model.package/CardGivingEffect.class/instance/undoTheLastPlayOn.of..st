action
undoTheLastPlayOn: aGame of: aPlayer 
	aPlayer removeLastCardFromDeck.
	aGame addLastTile: (UndoEffect new).