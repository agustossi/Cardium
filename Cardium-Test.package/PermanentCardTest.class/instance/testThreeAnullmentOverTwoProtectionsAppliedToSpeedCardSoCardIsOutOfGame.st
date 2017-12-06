tests
testThreeAnullmentOverTwoProtectionsAppliedToSpeedCardSoCardIsOutOfGame
	| aSpeedUpTile game seba board dice dice1 totalPlayers boardGenerator generator deckGenerator cards sebasSpeedCard |
	cards := OrderedCollection new.
	cards add: Speed new.
	cards add: Protection new.
	cards add: Protection new.
	cards add: Annulment new.
	cards add: Annulment new.
	cards add: Annulment new.
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
	sebasSpeedCard := seba deck first.
	self
		should: [ seba assertHisAffectingDeckHas: seba deck first ]
		raise: GameError.
	seba deck first isAppliedBy: seba toAffect: seba onThis: game.
	self
		shouldnt: [ seba assertHisAffectingDeckHas: seba cardsAffectingHim first ]
		raise: GameError.
	seba deck first
		isAppliedBy: seba
		toProtect: seba cardsAffectingHim first
		of: seba.
	seba deck first
		isAppliedBy: seba
		toProtect: seba cardsAffectingHim first
		of: seba.
	seba deck first
		isAppliedBy: seba
		toCancel: seba cardsAffectingHim first
		ofPlayer: seba
		onThis: game.
	self
		shouldnt: [ seba assertHisAffectingDeckHas: seba cardsAffectingHim first ]
		raise: GameError.
	seba deck first
		isAppliedBy: seba
		toCancel: seba cardsAffectingHim first
		ofPlayer: seba
		onThis: game.
	self
		shouldnt: [ seba assertHisAffectingDeckHas: seba cardsAffectingHim first ]
		raise: GameError.
	seba deck first
		isAppliedBy: seba
		toCancel: seba cardsAffectingHim first
		ofPlayer: seba
		onThis: game.
	self
		should: [ seba assertHisAffectingDeckHas: sebasSpeedCard ]
		raise: GameError