initialization
playersDecksInizialization: aGenerator
	
	players do: [ :player | (playersDecks at: (player)
				put:(aGenerator pickTwoCards))]
	