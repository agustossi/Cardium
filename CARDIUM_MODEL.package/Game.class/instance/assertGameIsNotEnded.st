action
assertGameIsNotEnded
	state asSymbol == 'Ended' asSymbol
		ifTrue: [ Error signal: 'Game has finished']