tests
testWhenAnnulmentIsUsedWithCushioningCardIsOutOfGame
	| agus game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards |
	
	
	cards := OrderedCollection new.
	cards add: Cushioning new.
	cards add: Annulment new.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	
	
	boardGenerator := TileFixedGenerator using: SpeedUpEffect new.
	
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 3
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.	
	 self assert: (game positionOf: seba) tiles equals: 0.
    self assert: (game positionOf: seba) rounds equals: 0.
    self assert: (game positionOf: agus) tiles equals: 0.
    self assert: (game positionOf: agus) rounds equals: 0.
    game nextTurn: seba.
    self assert: (game positionOf: seba) tiles equals: 5.
    self assert: (game positionOf: seba) rounds equals: 0.
    self assert: (game positionOf: agus) tiles equals: 0.
    self assert: (game positionOf: agus) rounds equals: 0.
    game nextTurn: agus.
    self assert: (game positionOf: seba) tiles equals: 5.
    self assert: (game positionOf: seba) rounds equals: 0.
    self assert: (game positionOf: agus) tiles equals: 6.
    self assert: (game positionOf: agus) rounds equals: 0.
	(seba deck first) isAppliedBy: seba onThis: game.    
    game nextTurn: seba.
    self assert: (game positionOf: seba) tiles equals: 10.
    self assert: (game positionOf: seba) rounds equals: 1.
    self assert: (game positionOf: agus) tiles equals: 6.
    self assert: (game positionOf: agus) rounds equals: 0.
 	 (agus deck at: 2) isAppliedBy: agus toCancel: (game cardsAffectingAllPlayers first) onThis: game. 
	
    game nextTurn: agus.
    self assert: (game positionOf: seba) tiles equals: 10.
    self assert: (game positionOf: seba) rounds equals: 1.
    self assert: (game positionOf: agus) tiles equals: 4.
    self assert: (game positionOf: agus) rounds equals: 1