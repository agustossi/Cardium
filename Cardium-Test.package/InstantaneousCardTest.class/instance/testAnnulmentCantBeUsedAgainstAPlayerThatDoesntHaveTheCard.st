tests
testAnnulmentCantBeUsedAgainstAPlayerThatDoesntHaveTheCard
	| agus aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anAnnulmentCard deckGenerator cards aSpeedCard |
	
	anAnnulmentCard := Annulment new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
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
	game nextTurn: seba.
	self
		should: [ anAnnulmentCard isAppliedBy: seba toCancel: aSpeedCard ofPlayer: agus onThis: game ]
		raise: GameError
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Player isnt being affected by this card' ]