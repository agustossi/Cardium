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
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
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
	self assert: (game positionOf: seba) tiles equals: 0.
	self assert: (game positionOf: seba) rounds equals: 0.
	aCushioningCard isAppliedBy: seba onThis: game.
	aSpeedCard isAppliedBy: seba toAffect: seba onThis: game.
	aSpeedCard isAppliedBy: seba toAffect: seba onThis: game.
	aSpeedCard isAppliedBy: seba toAffect: seba onThis: game.
	anOverloadCard isAppliedBy: seba toAffect: seba onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 7.
	self assert: (game positionOf: seba) rounds equals: 0