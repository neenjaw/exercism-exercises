/*
Overview: This is a collection of classes to perform an interpretation on a word problem.
*/

const operationMap = new Map([
  ['plus',          (a, b) => a + b],
  ['minus',         (a, b) => a - b],
  ['multiplied by', (a, b) => a * b],
  ['divided by',    (a, b) => a / b],
])

// Either tokenize numbers or operations
const equationTokenizerRe = /-?\d+|([a-z][ a-z]+[a-z])/gi

class ArgumentError extends Error {
  constructor(message) {
    super(message)
    this.name = 'ArgumentError'
  }
}

const questionStart = "What is"

class Wordy {
  constructor (question) {
    question = (question.startsWith(questionStart)) ? question.slice(questionStart.length) : question
    this.tokens = (question.match(equationTokenizerRe) || [])
  }

  answer () {
    const tokens = [...this.tokens]

    while (tokens.length >= 3) {
      const a  = assertNumber(tokens.shift())
      const op = assertOperation(tokens.shift())
      const b  = assertNumber(tokens.shift())

      const result = operationMap.get(op)(a,b)

      tokens.unshift(result)
    }

    if (tokens.length > 1) throw new ArgumentError("malformed problem statement")

    return assertNumber(tokens.pop())
  }
}

const assertNumber = (token) => {
  if (isNaN(token)) throw new ArgumentError("malformed problem statement")
  return Number(token)
};

const assertOperation = (token) => {
  if (!operationMap.has(token)) throw new ArgumentError("malformed problem statement")
  return token
};

export { Wordy as WordProblem, ArgumentError };
