initialization
initializeDeckWithThisGenerator: generator
	1 to: 50 do: [ :index | deck addAll: (generator pick) ]