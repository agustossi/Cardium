action
appliesCardEffectOn: aGame 
	| lastPlayer lastPlay |
	lastPlayer:= aGame lastPlayer.
	lastPlay := aGame lastPlay.
	lastPlay undoTheLastPlayOn: aGame of: lastPlayer.