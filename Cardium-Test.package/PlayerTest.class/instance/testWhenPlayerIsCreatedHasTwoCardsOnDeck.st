tests
testWhenPlayerIsCreatedHasTwoCardsOnDeck
    | agus |
    agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
    self assert: ( agus deckSize ) equals: 2.