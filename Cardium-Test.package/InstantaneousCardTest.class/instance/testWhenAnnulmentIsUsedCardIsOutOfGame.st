tests
testWhenAnnulmentIsUsedCardIsOutOfGame
	| agus aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anAnnulmentCard deckGenerator cards aSpeedCard |
	aSpeedCard := Speed new.
	aCardGivingTile := CardGivingEffect new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aSpeedCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	
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
	game nextTurn: agus.
	aSpeedCard isAppliedBy: seba toAffect: agus onThis: game.
	game nextTurn: seba.
	anAnnulmentCard isAppliedBy: agus toCancel: aSpeedCard ofPlayer: agus onThis: game.

	self
		should: [ agus assertHisAffectingDeckHas: aSpeedCard ]
		raise: GameError
		withExceptionDo: [ :signal | self assert: signal messageText
				equals: 'Player isnt being affected by this card' ]