accessing
pick
	| tilesToPick anEffectlesTile anAtomicBombTile aMoonWalkTile aWormHoleTile aSpeedUpTile aTimeMachineTile  |
	tilesToPick:= OrderedCollection new.
	
	anEffectlesTile:= Effectles new.
	anAtomicBombTile:= AtomicBombEffect new.
	aMoonWalkTile:= MoonWalkEffect new.
	aWormHoleTile:= WormholeEffect new.
	aSpeedUpTile:=SpeedUpEffect new.
	aTimeMachineTile:=TimeMachineEffect new.	
	
	1 to: 40 do: [:index | tilesToPick add: anEffectlesTile ]. 
	41 to: 42 do: [:index | tilesToPick add: anAtomicBombTile ].
	43 to: 57 do: [:index | tilesToPick add: aWormHoleTile  ].
	58 to: 72 do: [:index | tilesToPick add: aSpeedUpTile  ].
	73 to: 77 do: [:index | tilesToPick add: aMoonWalkTile  ].
	78 to: 100 do: [:index | tilesToPick add: aTimeMachineTile ].
	
	^ tilesToPick at: (aRandomGenerator nextInt: 100)