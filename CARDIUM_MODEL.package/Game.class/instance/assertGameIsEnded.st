action
assertGameIsEnded
	state asSymbol == 'Active' asSymbol
		ifTrue: [ Error signal: 'There isnt a winner yet' ]