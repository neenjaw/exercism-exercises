let expectedMinutesInOven = 40

func remainingMinutesInOven(elapsedMinutes: Int) -> Int
{
  guard elapsedMinutes >= 0 else { return 0 }
  return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: Int) -> Int
{
  layers * 2
}

func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int
{
  preparationTimeInMinutes(layers: layers) + elapsedMinutes
}