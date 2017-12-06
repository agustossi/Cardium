tests
testWhenPlayerAddsCardToDeckHisDeckContainsNewCard
    | agus aSpeedCard |
    agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
    aSpeedCard := Speed new.
    agus addToDeck: aSpeedCard.
    self shouldnt: (agus assertHisDeckHas: aSpeedCard) raise: GameError