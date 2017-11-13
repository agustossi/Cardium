as yet unclassified
effectOnThisGame: aGame on: aPlayer 
	|playerHistory currentPosition lastPosition aNumberOfTiles |
	playerHistory  := ((aGame playerPositions) at: aPlayer).
	currentPosition:= (aGame positionOf:aPlayer) totalTiles.
	lastPosition:= (playerHistory at:((playerHistory size)-3)) totalTiles.
	aNumberOfTiles := (currentPosition - lastPosition).
	aGame move: aPlayer tiles: (-1) * aNumberOfTiles.