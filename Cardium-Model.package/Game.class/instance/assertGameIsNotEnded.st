action
assertGameIsNotEnded
	state isEnded
		ifTrue: [ GameError signal: 'Game has finished']