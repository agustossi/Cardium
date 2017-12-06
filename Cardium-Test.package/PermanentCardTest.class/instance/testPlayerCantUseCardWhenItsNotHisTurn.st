tests
testPlayerCantUseCardWhenItsNotHisTurn
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator agus cards |
	
	aCardGivingTile := CardGivingEffect new.
	anOverloadCard := Overload new.
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
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
	game nextTurn: seba.
	game nextTurn: agus.
	self
		should: [ anOverloadCard isAppliedBy: agus toAffect: seba onThis: game. ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'It is not your turn' ]