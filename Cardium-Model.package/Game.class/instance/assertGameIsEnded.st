action
assertGameIsEnded
	state asSymbol == 'Active' asSymbol
		ifTrue: [ GameError signal: 'There isnt a winner yet' ]
