as yet unclassified
appliesEffectOn: playersPositions playing: aPlayer 
	
	| aSubSetOfPlayersToBeModified |
	aSubSetOfPlayersToBeModified := playersPositions keys reject: [:key | key asSymbol == '' asSymbol].	
	aSubSetOfPlayersToBeModified do:[:playerName | playersPositions at: playerName put: (Position withThisSumOfTiles: 0)]