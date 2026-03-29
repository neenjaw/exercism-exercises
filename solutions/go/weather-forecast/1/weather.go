// Package weather a package containing weather functions
package weather

var (
	// CurrentCondition describes the current weather condition
	CurrentCondition string
	// CurrentLocation describes the current location
	CurrentLocation string
)

// Log returns a string describing the current location and weather condition
func Log(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
