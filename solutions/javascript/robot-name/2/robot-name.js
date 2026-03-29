const TOTAL_NAMES = 26 * 26 * 10 * 10 * 10
const makeAlphabetArray = () => [...'ABCDEFGHIJKLMNOPQRSTUVWXYZ']

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
}

function getRandomArrayIndex(arr) {
  return getRandomInt(0, arr.length)
}

class RobotNameFactory {
  constructor() {
    this.reset()
  }

  reset() {
    this.names = []
    this.makeNames()
    this.shuffleNames()
  }

  makeNames() {
    for (const a of makeAlphabetArray()) {
      for (const b of makeAlphabetArray()) {
        for (let d = 0; d < 1000; d++) {
          const digits = `${d}`.padStart(3, '0')
          this.names.push(`${a}${b}${digits}`)
        }
      }
    }
  }

  shuffleNames() {
    for (let i = 0; i < this.names.length; i++) {
      const r = getRandomArrayIndex(this.names);
      const t = this.names[r]
      this.names[r] = this.names[i]
      this.names[i] = t
    }
  }

  get namesRemaining() {
    return TOTAL_NAMES - this.names.length
  }

  getName() {
    return this.names.pop()
  }
}

const nameRegistry = new RobotNameFactory()

export class Robot {
  constructor() {
    this._name = nameRegistry.getName()
  }

  get name() {
    return this._name
  }

  reset() {
    this._name = nameRegistry.getName()
  }
}

Robot.releaseNames = () => nameRegistry.reset();
