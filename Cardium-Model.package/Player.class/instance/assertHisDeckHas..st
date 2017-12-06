asserting
assertHisDeckHas: aCard 
	deck indexOf: aCard ifAbsent: [ GameError signal: 'Player doesnt have this card' ].