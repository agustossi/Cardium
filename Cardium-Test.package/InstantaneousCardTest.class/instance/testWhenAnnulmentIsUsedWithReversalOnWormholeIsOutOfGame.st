tests
testWhenAnnulmentIsUsedWithReversalOnWormholeIsOutOfGame
	| game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard anAnnulmentCard deckGenerator cards aWormholeTile agus |
	aWormholeTile := WormholeEffect new.
	aReversalCard := Reversal new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aWormholeTile.
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
	self assert: ( game positionOf: seba ) tiles equals: 5.
	self assert: ( game positionOf: agus ) tiles equals: 0.
	anAnnulmentCard isAppliedBy: agus toCancelInvertedTile: 1 onThis: game.
	game nextTurn: agus.
	self assert: ( game positionOf: seba ) tiles equals: 5.
	self assert: ( game positionOf: agus ) tiles equals: 8.

