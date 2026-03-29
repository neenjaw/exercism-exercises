/*

Earth: orbital period 365.25 Earth days, or 31557600 seconds
Mercury: orbital period 0.2408467 Earth years
Venus: orbital period 0.61519726 Earth years
Mars: orbital period 1.8808158 Earth years
Jupiter: orbital period 11.862615 Earth years
Saturn: orbital period 29.447498 Earth years
Uranus: orbital period 84.016846 Earth years
Neptune: orbital period 164.79132 Earth years

*/

export const orbitalPeriod = {
  earth:   1,
  mercury: 0.2408467,
  venus:   0.61519726,
  mars:    1.8808158,
  jupiter: 11.862615,
  saturn:  29.447498,
  uranus:  84.016846,
  neptune: 164.79132
};

export const age = (planet, earthAgeInSeconds) => {
  const convertSecondsToYears = (seconds) => seconds / 60 / 60 / 24 / 365.25;
  const convertToPlanetYears = (planet, earthYears) => earthYears / orbitalPeriod[planet];
  const roundToTwoPlaces = (number) => Math.round(number * 100) / 100;

  return roundToTwoPlaces(convertToPlanetYears(planet, convertSecondsToYears(earthAgeInSeconds)))
};
