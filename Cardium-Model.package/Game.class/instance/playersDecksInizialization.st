initialization
playersDecksInizialization
	
	players do: [ :player | (playersDecks at: (player)
				put:(OrderedCollection new))]
	