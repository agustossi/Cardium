action
nextTurn: aPlayer
	| aNumberOfTiles diceThrow |
	self assertGameIsNotEnded.
	self assertIsTheTurnof: aPlayer.
	diceThrow := 0.
	diceThrow := dice sumNumbers: [ :d | d faceValue ].
	aNumberOfTiles := self applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow.
	self move: aPlayer tiles: aNumberOfTiles.
	self applyingTileEffectsOn: aPlayer.
	self keepingTrackOfPlayerIndex.
	self isWinner: aPlayer