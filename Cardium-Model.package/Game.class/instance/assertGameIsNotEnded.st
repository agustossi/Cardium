action
assertGameIsNotEnded
	state asSymbol == 'Ended' asSymbol
		ifTrue: [ GameError signal: 'Game has finished']