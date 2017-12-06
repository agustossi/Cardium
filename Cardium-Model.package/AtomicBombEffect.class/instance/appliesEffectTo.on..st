affecting
appliesEffectTo: aPlayer on: aGame 
	|  players |
	players := aGame players.	
	players do:[:player | aGame move: player tiles: (-1)*((aGame positionOf: player) totalTiles)]
		
		