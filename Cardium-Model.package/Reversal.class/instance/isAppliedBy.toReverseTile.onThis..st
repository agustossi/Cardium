action
isAppliedBy: aPlayer toReverseTile: aTile onThis: aGame 
	(aTile between: 1 and: (aGame board numberOfTiles)) ifFalse: [ GameError signal: 'Tile must be between 1 and board size' ].
	aGame assertIsTheTurnOf: aPlayer.
	aPlayer assertHisDeckHas: self.
	aPlayer removeFromDeck: self.
	(aGame board tileAtPosition: aTile) invertEffectOfTile: aTile On: aGame.