initialization
initializeDeckWithThisGenerator: generator
	1 to: 10 do: [ :index | deck addAll: (generator pick) ]