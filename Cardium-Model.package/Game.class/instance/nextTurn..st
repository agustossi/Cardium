action
nextTurn: aPlayer
	| aNumberOfTiles |
	self assertGameIsNotEnded.
	self assertIsTheTurnof: aPlayer.
	aNumberOfTiles := 0.
	aNumberOfTiles := dice sumNumbers: [ :d | d faceValue ].
	aNumberOfTiles := self applyPermanentEffectsOn: aPlayer withThisThrow: aNumberOfTiles.
	self move: aPlayer tiles: aNumberOfTiles.
	self applyingTileEffectsOn: aPlayer.
	self keepingTrackOfPlayerIndex.
	self isWinner: aPlayer