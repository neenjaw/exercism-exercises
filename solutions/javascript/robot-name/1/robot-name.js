const TOTAL_NUMBER_OF_LETTERS = 26 * 26;
const TOTAL_NUMBER_OF_NUMBERS = 10 * 10 * 10;

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
}

function getRandomLetters() {
  const letterNumber = getRandomInt(0, TOTAL_NUMBER_OF_LETTERS)
  const letterValues = [Math.floor(letterNumber/26)%26, letterNumber%26]
  const [a, b] = letterValues.map(l => String.fromCharCode(l+65))

  return `${a}${b}`
}

function getRandomNumbers() {
  const number = getRandomInt(0, TOTAL_NUMBER_OF_NUMBERS)
  return `${number}`.padStart(3, '0')
}

function getRandomName() {
  return getRandomLetters() + getRandomNumbers()
}

const nameRegistry = new Set()

function getUniqueName() {
  let name
  do {
    name = getRandomName()
  } while (nameRegistry.has(name));
  nameRegistry.add(name)
  return name
}

export class Robot {
  constructor() {
    this._name = getUniqueName()
  }

  get name() {
    return this._name
  }

  reset() {
    this._name = getUniqueName()
  }
}

Robot.releaseNames = () => nameRegistry.clear();
