as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| board players |
	players := aGame players.
	"playerPositions := aGame playerPositions."
	board:= aGame board.	
	"playerPositions do:[:positionHistory | (positionHistory add: (BoardPosition tile:0 totalTiles:0 round:0))]"
	players do:[:player | aGame move: player tiles: (-1)*((aGame positionOf: player) totalTiles)]
		
		