tests
testWhenAnnulmentIsUsedWithReversalCardOnSpeedUpIsOutOfGame
	| game seba board dice dice1 totalPlayers boardGenerator generator aReversalCard anAnnulmentCard aSpeedUpTile deckGenerator cards |
	aSpeedUpTile := SpeedUpEffect new.
	aReversalCard := Reversal new.
	anAnnulmentCard := Annulment new.
	cards := OrderedCollection new.
	cards add: anAnnulmentCard.
	cards add: aReversalCard.
	boardGenerator := TileFixedGenerator using: aSpeedUpTile.
	deckGenerator := DeckFixedGenerator using: cards.
	seba := Player
		named: 'sebastian'
		calculatingDeckWith: deckGenerator.
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
	aReversalCard isAppliedBy: seba toReverseTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 7.
	anAnnulmentCard isAppliedBy: seba toCancelInvertedTile: 1 onThis: game.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 3.

