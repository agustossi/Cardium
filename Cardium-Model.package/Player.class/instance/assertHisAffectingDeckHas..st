asserting
assertHisAffectingDeckHas: aCard 
	cardsAffectingDeck indexOf: aCard ifAbsent: [ GameError signal: 'Player isnt being affected by this card' ]