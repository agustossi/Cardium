action
tileEffectAppliedTo: aPlayer 
	| currentPosition currentTile |
	state assertIsTheTurnOf: aPlayer.
	currentPosition := (self positionOf: aPlayer).
	currentTile := board tileAtPosition:(currentPosition tiles).
	currentTile appliesEffectTo: aPlayer on: self.
	allTilesStepped add: currentTile.
	lastPlay := allTilesStepped.