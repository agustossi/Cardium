action
nextTurn: aPlayer
	| aNumberOfTiles diceThrow |
	state assertGameIsActive.
	state assertIsTheTurnOf: aPlayer.
	diceThrow := 0.
	diceThrow := dice sumNumbers: [ :d | d faceValue ].
	aNumberOfTiles := self applyPermanentEffectsOn: aPlayer withThisThrow: diceThrow.
	self move: aPlayer tiles: aNumberOfTiles.
	self tileEffectAppliedTo: aPlayer.
	self keepingTrackOfPlayerIndex.
	self isWinner: aPlayer