tests
testTileToApplyRevesalOnMustBeBetween1AndBoardSize
	| anEffectlesTile game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard deckGenerator agus cards |
	
	anEffectlesTile := Effectles new.
	aReversalCard := Reversal new.
	cards := OrderedCollection new.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: anEffectlesTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 3.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	self
		should: [ aReversalCard isAppliedBy: seba toReverseTile: 14 onThis: game. ]
		raise: GameError
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Tile must be between 1 and board size' ]