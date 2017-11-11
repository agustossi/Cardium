as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| board players |
	players := aGame players.
	board:= aGame board.	
	players do:[:player | aGame move: player tiles: (-1)*((aGame positionOf: player) totalTiles)]
		
		