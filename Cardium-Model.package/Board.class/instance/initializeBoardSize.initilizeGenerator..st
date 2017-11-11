as yet unclassified
initializeBoardSize: size initilizeGenerator: aTileGenerator 

	numberOfTiles:= size.
	tiles:= OrderedCollection new.
	1 to: numberOfTiles do: [ :index | tiles add: (aTileGenerator pick) ].