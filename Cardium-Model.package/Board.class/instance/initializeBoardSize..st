initialization
initializeBoardSize: anInteger 
	| tileGenerator |
	numberOfTiles:= anInteger.
	tiles:= OrderedCollection new.
	tileGenerator := TileRandomGenerator new.
	1 to: numberOfTiles do: [ :index | tiles add: (tileGenerator pick) ].
	