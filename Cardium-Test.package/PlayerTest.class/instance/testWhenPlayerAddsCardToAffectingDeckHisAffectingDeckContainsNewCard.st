tests
testWhenPlayerAddsCardToAffectingDeckHisAffectingDeckContainsNewCard
    | agus aSpeedCard |
    agus := Player named: 'agustina' calculatingDeckWith: (DeckRandomGenerator new).
    aSpeedCard := Speed new.
    agus addOnAffectingDeck: aSpeedCard.
    self shouldnt: (agus assertHisAffectingDeckHas: aSpeedCard) raise: GameError