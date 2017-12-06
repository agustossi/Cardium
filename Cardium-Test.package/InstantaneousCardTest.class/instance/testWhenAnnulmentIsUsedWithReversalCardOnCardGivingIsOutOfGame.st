tests
testWhenAnnulmentIsUsedWithReversalCardOnCardGivingIsOutOfGame
	| game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard anAnnulmentCard deckGenerator cards aCardGivingTile agus |
	aCardGivingTile := CardGivingEffect new.
	aReversalCard := Reversal new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	agus := Player named: 'agustina' calculatingDeckWith: deckGenerator.
	seba := Player
		named: 'sebastian'
		calculatingDeckWith: deckGenerator.
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
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (seba deckSize) equals: 0.
	self assert: ( agus deckSize ) equals: 2.
	anAnnulmentCard isAppliedBy: agus toCancelInvertedTile: 1 onThis: game.
	game nextTurn: agus.
	self assert: (seba deckSize) equals: 0.
	self assert: ( agus deckSize ) equals: 2.

