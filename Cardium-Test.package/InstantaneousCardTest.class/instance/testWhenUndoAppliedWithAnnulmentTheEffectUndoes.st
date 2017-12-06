tests
testWhenUndoAppliedWithAnnulmentTheEffectUndoes
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard aCardGivingTile anAnnulmentCard aSpeedCard |
	aCardGivingTile := CardGivingEffect new.
	anUndoCard := Undo new.
	anAnnulmentCard := Annulment new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: anUndoCard.
	cards add: anAnnulmentCard.
	cards add: aSpeedCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	
	board := Board ofSize: 17 withThisGenerator: boardGenerator.
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
	aSpeedCard isAppliedBy: seba toAffect: seba onThis: game.
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: seba) rounds equals: 0.
	anAnnulmentCard isAppliedBy: seba toCancel: aSpeedCard ofPlayer: seba onThis: game. 
	anUndoCard isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 13.
	self assert: (game positionOf: seba) rounds equals: 0