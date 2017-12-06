tests
testUndoCardCantBeUsedIfPlayerDoesntHaveIt
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aSpeedUpTile aSpeedCard anUndoCard |
	anUndoCard := Undo new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	
	aSpeedUpTile := SpeedUpEffect new.
	
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
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
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self
		should: [ anUndoCard isAppliedBy: seba onThis: game]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]