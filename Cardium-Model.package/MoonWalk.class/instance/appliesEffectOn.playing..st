as yet unclassified
appliesEffectOn: playersPositions playing: aPlayer 
	
	| aSubSetOfPlayersToBeModified |
	aSubSetOfPlayersToBeModified := playersPositions keys reject: [:key | key asSymbol == (aPlayer name asSymbol) ].	
	aSubSetOfPlayersToBeModified do:[:playerName | playersPositions at: playerName put: (Position withThisSumOfTiles: 0)]