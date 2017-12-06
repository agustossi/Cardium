tests
testWhenUndoAppliedWithAnnulmentTheEffectUndoes
	| game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards anUndoCard aCardGivingTile anAnnulmentCard aSpeedCard |
	
	anUndoCard := Undo new.
	anAnnulmentCard := Annulment new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	
	cards add: anUndoCard.
	cards add: anAnnulmentCard.
	cards add: aSpeedCard.
	
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	
	
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	
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
	((seba deck) at: 3) isAppliedBy: seba toAffect: seba onThis: game.
	
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
	self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: seba) rounds equals: 0.
	(seba deck at:2) isAppliedBy: seba toCancel:  ((seba cardsAffectingHim) first) ofPlayer: seba onThis: game.
	(seba deck first) isAppliedBy: seba onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 13.
	self assert: (game positionOf: seba) rounds equals: 0