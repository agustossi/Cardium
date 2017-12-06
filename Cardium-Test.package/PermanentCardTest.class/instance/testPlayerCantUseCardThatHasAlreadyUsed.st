tests
testPlayerCantUseCardThatHasAlreadyUsed
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator cards |
	anOverloadCard := Overload new.
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	
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
	anOverloadCard isAppliedBy: seba toAffect: seba onThis: game.
	self
		should: [ anOverloadCard isAppliedBy: seba toAffect: seba onThis: game. ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]