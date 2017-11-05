as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	|playerHistory currentPosition lastPosition movesToBeMade |
	playerHistory  := ((aGame playerPositions) at: aPlayer).
	currentPosition:= (aGame positionOf:aPlayer) totalTiles.
	lastPosition:= (playerHistory at:((playerHistory size)-1)) totalTiles.
	movesToBeMade := (currentPosition - lastPosition).
	aGame playerHistoryOf: aPlayer updatedWith: (-1) * movesToBeMade.
	