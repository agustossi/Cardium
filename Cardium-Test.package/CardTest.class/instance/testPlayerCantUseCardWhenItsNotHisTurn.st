tests
testPlayerCantUseCardWhenItsNotHisTurn
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator agus cards|
	seba := Player named: 'sebastian'.
	agus := Player named: 'agustina'.
	aCardGivingTile := CardGiving new.
	anOverloadCard := Overload new.	
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
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
		should: [ game thePlayer: agus appliesPermanent: anOverloadCard on: seba ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'It is not your turn' ]