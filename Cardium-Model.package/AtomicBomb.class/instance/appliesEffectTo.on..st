as yet unclassified
appliesEffectTo: aPlayer on: aGame 
	| playerPositions board |
	playerPositions := aGame playerPositions.
	board:= aGame board.
	"aSubSetOfPlayersToBeModified := playerPositions keys reject: [:key | key asSymbol == '' asSymbol]."	
	playerPositions do:[:positionHistory | (positionHistory add: (BoardPosition tile:0 totalTiles:0 round:0))]
		
		