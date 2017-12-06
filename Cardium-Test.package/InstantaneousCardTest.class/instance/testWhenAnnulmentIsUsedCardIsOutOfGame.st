tests
testWhenAnnulmentIsUsedCardIsOutOfGame
	| agus aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anAnnulmentCard deckGenerator cards aSpeedCard cardToBeCanceled|
	aSpeedCard := Speed new.
	aCardGivingTile := CardGivingEffect new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aSpeedCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	
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
	game nextTurn: agus.
	((seba deck) second) isAppliedBy: seba toAffect: agus onThis: game.	
	game nextTurn: seba.
	cardToBeCanceled := (agus cardsAffectingHim) first.	
	((agus deck) first) isAppliedBy: agus toCancel:  ((agus cardsAffectingHim) first) ofPlayer: agus onThis: game.
	self
		should: [ agus assertHisAffectingDeckHas:  cardToBeCanceled ]
		raise: GameError
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Player isnt being affected by this card' ]