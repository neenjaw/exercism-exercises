/*
Overview: This is a collection of classes to perform an interpretation on a word problem.

Wordy's constructor is called with a word problem, then the class is initialized with a finite-state-machine
and the word problem is massaged into a format for further parsing by the finite-state-machine.

When the answer is requested, the FSM is run and the stack is returned as the answer
*/

const operationMap = new Map([
  ['plus',          (a, b) => a + b],
  ['minus',         (a, b) => a - b],
  ['multiplied by', (a, b) => a * b],
  ['divided by',    (a, b) => a / b],
])

const operations = [...operationMap.keys()]

const operationsRe = new RegExp(operations.join('|'), 'g')
const digitRe = /-?\d+/g

class ArgumentError extends Error {
  constructor(message) {
    super(message)
    this.name = 'ArgumentError'
  }
}

class Wordy {
  constructor (question) {
    this.operations = (question.match(operationsRe) || []);
    this.digits = (question.match(digitRe) || []).map(Number);
  }

  answer () {
    const digits = [...this.digits]
    const operations = [...this.operations]

    if (digits.length < 2 || operations.length < 1) throw new ArgumentError('malformed equation')

    while (operations.length > 0 && digits.length >= 2) {
      const a = digits.shift()
      const b = digits.shift()
      const op = operations.shift()

      const result = operationMap.get(op)(a,b)

      digits.unshift(result)
    }

    if (operations.length > 0 || digits.length != 1) throw new ArgumentError('malformed equation')

    return digits.pop()
  }
}

export { Wordy as WordProblem, ArgumentError };
