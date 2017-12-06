tests
testWhenAnnulmentIsUsedWithReversalCardOnMoonWalkIsOutOfGame
	| game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard anAnnulmentCard deckGenerator cards aMoonWalkTile agus |
	aMoonWalkTile := MoonWalkEffect new.
	aReversalCard := Reversal new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aMoonWalkTile.
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
	self assert: (game positionOf: seba) tiles equals: 1.
	self assert: (game positionOf: agus) tiles equals: 3.
	anAnnulmentCard isAppliedBy: seba toCancelInvertedTile: 1 onThis: game.
	game nextTurn: agus.
	self assert: (game positionOf: seba) tiles equals: 8.
	self assert: (game positionOf: agus) tiles equals: 5.

