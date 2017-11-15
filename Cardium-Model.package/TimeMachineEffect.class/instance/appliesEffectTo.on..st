affecting
appliesEffectTo: aPlayer on: aGame 
	|playerHistory currentPosition lastPosition aNumberOfTiles |
	playerHistory  := ((aGame playerPositions) at: aPlayer).
	currentPosition:= (aGame positionOf:aPlayer) totalTiles.
	lastPosition:= (playerHistory at:((playerHistory size)-1)) totalTiles.
	aNumberOfTiles := (currentPosition - lastPosition).
	aGame move: aPlayer tiles: (-1) * aNumberOfTiles.
	