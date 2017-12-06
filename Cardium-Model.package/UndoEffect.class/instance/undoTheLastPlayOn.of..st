action
undoTheLastPlayOn: aGame of: aPlayer 
	| lastPlay |
	aGame removeLastTileStepped.
	lastPlay := aGame lastPlay.
	lastPlay undoTheLastPlayOn: aGame of: aPlayer.