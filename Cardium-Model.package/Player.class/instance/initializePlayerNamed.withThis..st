initialization
initializePlayerNamed: aName withThis: deckGenerator
	
	name := aName.
	deck := deckGenerator pickTwoCards.
	cardsAffectingDeck := OrderedCollection new.