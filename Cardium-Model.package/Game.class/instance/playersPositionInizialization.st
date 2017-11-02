initialization
playersPositionInizialization
	players
		do: [ :player | 
			playerPositions
				at: player name
				put:
					(OrderedCollection new
						add: (BoardPosition tile: 0 totalTiles: 0 round: 0)) ]