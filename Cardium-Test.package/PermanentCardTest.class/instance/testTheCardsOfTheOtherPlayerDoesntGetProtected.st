tests
testTheCardsOfTheOtherPlayerDoesntGetProtected
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator cards aProtectionCard agus sebasDeck agusDeck cardsAffectingSeba |
	anOverloadCard := Overload new.
	aProtectionCard := Protection new.
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	cards add: aProtectionCard.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player named: 'sebastian' calculatingDeckWith: deckGenerator.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	aCardGivingTile := CardGivingEffect new.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	totalPlayers add: agus.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	sebasDeck := seba deck.
	cardsAffectingSeba := seba cardsAffectingHim.
	agusDeck := agus deck.
	seba deck first isAppliedBy: seba toAffect: seba onThis: game.
	sebasDeck first
		isAppliedBy: seba
		toProtect: cardsAffectingSeba first
		of: seba.
	game nextTurn: seba.
	self assert: (cardsAffectingSeba at: 1) state isProtected.
	self assert: (agusDeck at: 1) state isUnprotected