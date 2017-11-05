accessing
appliesEffectOn: playersPositions playing: aPlayer 
	
	| aSubSetOfPlayersToBeModified |
	aSubSetOfPlayersToBeModified := playersPositions keys reject: [:key | key asSymbol == '' asSymbol].
	
	"aSubSetOfPlayersToBeModified do:[:playerName | playersPositions at: playerName put: (Position moving: (playersPositions at: playerName) sumOfTiles * (-1) from: (playersPositions at: playerName ) lastTiles onABoardOf: (playersPositions at: playerName) boardSize )]"