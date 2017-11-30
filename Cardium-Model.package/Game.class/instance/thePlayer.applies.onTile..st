as yet unclassified
thePlayer: aPlayer applies: aCard onTile: aTile 
	(aTile between: 1 and: (board numberOfTiles)) ifFalse: [ GameError signal: 'Tile must be between 1 and board size' ].
	self assertIsTheTurnof: aPlayer.
	self assertThePlayers: aPlayer deckHasThis: aCard.
	self remove: aCard fromDeckOf: aPlayer.
	(board tileAtPosition: aTile) invertEffectOfTile: aTile On: self.