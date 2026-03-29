package lasagna

const OvenTime = 40
const minutesPerLayer = 2

func RemainingOvenTime(timeElapsed int) int {
	return OvenTime - timeElapsed
}

func PreparationTime(layerCount int) int {
	return layerCount * minutesPerLayer
}

func ElapsedTime(layerCount int, timeElapsedInOven int) int {
	return PreparationTime(layerCount) + timeElapsedInOven
}
