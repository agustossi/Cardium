tests
testWhenCushioningOverload3SpeedAreAffectingPlayerthrows4SetpsInSpeedUpEndsIn7
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards aCushioningCard anOverloadCard aSpeedCard aSpeedUpTile |
	aCushioningCard := Cushioning new.
	anOverloadCard := Overload new.
	aSpeedCard := Speed new.
	aSpeedUpTile := SpeedUpEffect new.
	cards := OrderedCollection new.
	cards add: aCushioningCard.
	cards add: anOverloadCard.
	cards add: aSpeedCard.
	cards add: aSpeedCard.
	cards add: aSpeedCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.	
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	
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
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	(seba deck first) isAppliedBy: seba onThis: game.
	((seba deck) second) isAppliedBy: seba toAffect: seba onThis: game.
	((seba deck) second) isAppliedBy: seba toAffect: seba onThis: game.
	((seba deck) second) isAppliedBy: seba toAffect: seba onThis: game.
	((seba deck) first) isAppliedBy: seba toAffect: seba onThis: game.
	
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 7.
	self assert: (game positionOf: seba) rounds equals: 0