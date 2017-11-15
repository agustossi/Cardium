tests
testWhenPotentiationAppliedWithAtomicBombNothingHappens
	|   game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards aPotentiationCard anAtomicBombTile  |
	seba := Player named: 'sebastian'.	
	
	anAtomicBombTile := AtomicBomb new.
	aPotentiationCard := Potentiation new.	
	cards := OrderedCollection new.	
	cards add: aPotentiationCard.
	
	boardGenerator := TileFixedGenerator using: anAtomicBombTile.
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
	game thePlayer: seba applies: aPotentiationCard.
	self assert: (game positionOf: seba) tiles equals: 0.
   self assert: (game positionOf: seba) rounds equals: 0.
	