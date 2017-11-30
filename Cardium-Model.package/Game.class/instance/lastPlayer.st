accessing
lastPlayer
	| index |
	playerIndex == 1 ifTrue: [ index:=players size ] ifFalse: [ index:=playerIndex-1 ].
	^ players at: (index).