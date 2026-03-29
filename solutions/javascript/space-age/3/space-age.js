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

const yearsRelativeToEarthYears = {
  earth:   1,
  mercury: 0.2408467,
  venus:   0.61519726,
  mars:    1.8808158,
  jupiter: 11.862615,
  saturn:  29.447498,
  uranus:  84.016846,
  neptune: 164.79132
};

const SECONDS_PER_MINUTE = 60;
const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const DAYS_PER_ORBITAL_PERIOD = 365.25;

const SECONDS_PER_ORBITAL_PERIOD = SECONDS_PER_MINUTE * MINUTES_PER_HOUR * HOURS_PER_DAY * DAYS_PER_ORBITAL_PERIOD;

const convertSecondsToYears = (seconds) => seconds / SECONDS_PER_ORBITAL_PERIOD;

const convertToPlanetYears = (planet, earthYears) => earthYears / yearsRelativeToEarthYears[planet];

const roundToPrecision = (number, places) => Number(Math.round(number + 'e'+places) + 'e-'+places);

export const age = (planet, earthAgeInSeconds) => {
  return roundToPrecision(convertToPlanetYears(planet, convertSecondsToYears(earthAgeInSeconds)), 2);
};
