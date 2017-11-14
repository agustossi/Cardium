as yet unclassified
appliesCardEffectOn: aGame 
	| lastPlayer lastTile |
	lastPlayer:= aGame lastPlayer.
	lastTile := aGame lastTileStepped.
	lastTile undoTheLastPlayOn: aGame of: lastPlayer.