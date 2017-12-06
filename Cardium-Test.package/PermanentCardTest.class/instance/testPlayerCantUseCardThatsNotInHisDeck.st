tests
testPlayerCantUseCardThatsNotInHisDeck
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator cards aSpeedCard |
	aCardGivingTile := CardGivingEffect new.
	anOverloadCard := Overload new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 3.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	self
		should: [ aSpeedCard isAppliedBy: seba toAffect: seba onThis: game. ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]