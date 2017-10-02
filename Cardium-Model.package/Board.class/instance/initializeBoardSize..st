initialization
initializeBoardSize: anInteger 
	numberOfTiles:= anInteger.
	tiles:= OrderedCollection new.
	1 to: numberOfTiles do: [ :index | tiles add: (Tile pick) ].
	