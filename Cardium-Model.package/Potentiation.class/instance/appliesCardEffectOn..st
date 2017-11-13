as yet unclassified
appliesCardEffectOn: aGame 
	| lastPlayer lastTile |
	lastPlayer:= aGame lastPlayer.
	lastTile := aGame lastTileStepped.
	lastTile effectOnThisGame: aGame on: lastPlayer.
	
	