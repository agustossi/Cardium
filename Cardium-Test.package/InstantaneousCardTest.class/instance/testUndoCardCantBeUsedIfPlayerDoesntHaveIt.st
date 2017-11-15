tests
testUndoCardCantBeUsedIfPlayerDoesntHaveIt
	|   game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards aSpeedUpTile aSpeedCard anUndoCard |
	seba := Player named: 'sebastian'.
	anUndoCard := Undo new.	
	aSpeedUpTile := SpeedUp new.
	aSpeedCard := Speed new.	
	cards := OrderedCollection new.	
	cards add: aSpeedCard.
	
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	deckGenerator := DeckFixedGenerator using: cards.
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
	self should: [ game thePlayer: seba applies: anUndoCard ] raise: GameError withExceptionDo: [:signal | self assert: signal messageText equals: 'Player doesnt have this card'].
	