tests
testTheCushioningsOfTheOtherPlayerDoesntGetProtected
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aCushioning deckGenerator cards aProtectionCard agus sebasDeck globalDeck |
	aCushioning := Cushioning new.
	aProtectionCard := Protection new.
	cards := OrderedCollection new.
	cards add: aCushioning.
	cards add: aCushioning.
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
	(seba deck first) isAppliedBy: seba onThis: game.
	(seba deck first) isAppliedBy: seba onThis: game.
	globalDeck := game cardsAffectingAllPlayers.
	(sebasDeck first) isAppliedBy: seba toProtect: globalDeck first onThis: game. 
	game nextTurn: seba.
	self assert: game cardsAffectingAllPlayers first state isProtected.
	self assert: (agus deck) first state isUnprotected