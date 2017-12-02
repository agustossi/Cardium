tests
testWhenSpeedCardIsCreatedStateIsUnprotected
	| aSpeedCard |
	aSpeedCard := Speed new.
	self assert: (aSpeedCard state) isUnprotected.