initialization
initializeWithThisSumOfTiles: sumTiles
	lastTiles := totalTiles.
	lastTiles ifNil: [lastTiles := 0 ].	
	totalTiles:= sumTiles.