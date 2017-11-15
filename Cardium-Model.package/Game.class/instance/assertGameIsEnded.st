asserting
assertGameIsEnded
	state isEnded
		ifFalse: [ GameError signal: 'There isnt a winner yet' ]
