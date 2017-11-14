tests
testWhenThreeUndoAppliedWithSpeedUpTheEffectOfUndoUndoes
	|   game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards anUndoCard aSpeedUpTile |
	seba := Player named: 'sebastian'.	
	aSpeedUpTile := SpeedUp new.
	anUndoCard := Undo new.	
	cards := OrderedCollection new.	
	cards add: anUndoCard.
	
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
	self assert: (game positionOf: seba) tiles equals: 5.
   self assert: (game positionOf: seba) rounds equals: 0.	
	game thePlayer: seba applies: anUndoCard.
	self assert: (game positionOf: seba) tiles equals: 1.
   self assert: (game positionOf: seba) rounds equals: 0.	
	game thePlayer: seba applies: anUndoCard.
	self assert: (game positionOf: seba) tiles equals: 5.
   self assert: (game positionOf: seba) rounds equals: 0.	
	game thePlayer: seba applies: anUndoCard.
	self assert: (game positionOf: seba) tiles equals: 1.
   self assert: (game positionOf: seba) rounds equals: 0.	