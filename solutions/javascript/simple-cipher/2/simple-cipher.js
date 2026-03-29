const LETTER_RANGE_START = 'a'.charCodeAt(0)
const LETTER_RANGE_END = 'z'.charCodeAt(0)
const LETTER_RANGE_LENGTH = (LETTER_RANGE_END - LETTER_RANGE_START + 1)

function generateKey() {
  const min = LETTER_RANGE_START
  const max = LETTER_RANGE_END
  const randomLetter = () => String.fromCharCode(Math.floor(Math.random() * (max - min + 1)) + min)
  const letters = []

  for (let index = 0; index < 100; index++) {
    letters.push(randomLetter())
  }

  return letters
}

function shift(letter, shiftLetter, direction = 1) {
  const letterCode = letter.charCodeAt(0)
  const shiftAmount = shiftLetter.charCodeAt(0) - LETTER_RANGE_START
  let shifted = letterCode + (direction * shiftAmount)

  switch (true) {
    case shifted < LETTER_RANGE_START:
      shifted += LETTER_RANGE_LENGTH
      break;

    case shifted > LETTER_RANGE_END:
      shifted -= LETTER_RANGE_LENGTH
      break;
  }

  return String.fromCharCode(shifted)
}

export class Cipher {
  constructor(key = generateKey()) {
    if ((typeof key) == 'string'){
      key = key.split('')
    }

    this._key = key
  }

  encode(msg) {
    return this.shift(msg)
  }

  decode(msg) {
    return this.shift(msg, -1)
  }

  shift(msg, direction = 1) {
    const key = this.key
    const shiftLetter = (l, i) => shift(l, key[i % key.length], direction)

    return msg.split('')
              .map(shiftLetter)
              .join('')
  }

  get key() {
    return this._key.join('')
  }
}