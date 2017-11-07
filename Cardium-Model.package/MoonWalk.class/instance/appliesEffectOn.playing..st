accessing
appliesEffectOn: playersPositions playing: aPlayer 
	
	| aSubSetOfPlayersToBeModified |
	aSubSetOfPlayersToBeModified := playersPositions keys reject: [:key | key asSymbol == (aPlayer name asSymbol) ].	
	aSubSetOfPlayersToBeModified do:[:playerName | playersPositions at: playerName put: (Position moving: -3 from: 0 onABoardOf: 10)]