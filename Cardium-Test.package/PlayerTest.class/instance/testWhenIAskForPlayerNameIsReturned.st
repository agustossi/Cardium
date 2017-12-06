tests
testWhenIAskForPlayerNameIsReturned
	| player cards deckGenerator |
	cards:= OrderedCollection new.
	cards add: Speed new.
	deckGenerator := DeckFixedGenerator using: cards.
	player := Player named: 'pepe' calculatingDeckWith: deckGenerator.
	self assert: player name equals: 'pepe'