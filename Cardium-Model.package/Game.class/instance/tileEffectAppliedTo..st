action
tileEffectAppliedTo: aPlayer 
	| positionHistory currentPosition currentTile |
	self assertIsTheTurnof: aPlayer.
	positionHistory := playerPositions at: (aPlayer).
	currentPosition := (self positionOf: aPlayer).
	currentTile := board tileAtPosition:(currentPosition tiles).
	currentTile appliesEffectTo: aPlayer on: self.
	allTilesStepped add: currentTile.
	lastPlay := allTilesStepped.