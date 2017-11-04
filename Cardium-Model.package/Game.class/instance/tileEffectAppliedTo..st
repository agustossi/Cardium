as yet unclassified
tileEffectAppliedTo: aPlayer 
	| positionHistory currentPosition currentTile |
	self assertIsTheTurnof: aPlayer.
	positionHistory := playerPositions at: (aPlayer name).
	currentPosition := (self positionOf: aPlayer).
	currentTile := board tileAtPosition:(currentPosition tiles).
	currentTile appliesEffectOn: players playing:aPlayer.
	