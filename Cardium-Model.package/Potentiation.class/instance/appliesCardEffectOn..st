action
appliesCardEffectOn: aGame
	| lastPlayer lastTile |
	lastPlayer := aGame lastPlayer.
	lastTile := aGame lastTileStepped.
	lastTile applyAugmentedEffectOver: lastPlayer On: aGame