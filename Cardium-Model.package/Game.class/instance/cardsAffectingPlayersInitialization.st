initialization
cardsAffectingPlayersInitialization
	
	players do: [ :player | (cardsAffectingPlayers at: (player)
				put:(OrderedCollection new))]
	