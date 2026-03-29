/*
Overview: This is a collection of classes to perform an interpretation on a word problem.

Wordy's constructor is called with a word problem, then the class is initialized with a finite-state-machine
and the word problem is massaged into a format for further parsing by the finite-state-machine.

When the answer is requested, the FSM is run and the stack is returned as the answer
*/

class ArgumentError extends Error {
  constructor(message) {
    super(message)
    this.name = "ArgumentError"
  }
}

// defaultTransitions for the FSM
// each state has an array of possible transitions, it may have a 'transitionIf' function which
// determines if the transition to that state is appropriate.  It must have (except the start and end states),
// a state mutator function to manipulate the state.
const defaultTransitions = {
  start: {
    next: [
      'question'
    ]
  },
  question: {
    next: [
      'number'
    ],
    transitionIf: token => token === 'what_is',
    stateMutator: (token, state) => state
  },
  number: {
    next: [
      'operation',
      'end'
    ],
    transitionIf: token => !isNaN(Number(token)),
    stateMutator: (token, state) => {
      // convert the string to a number
      state.stack.push(Number(token))

      // check if an operation must be done
      if (state.operationPending && state.stack.length >= state.operationArity) {
        const args = state.stack.slice(0, state.operationArity)
        state.stack = state.stack.slice(state.operationArity)

        const result = state.operationPending.apply(this, args)
        state.stack.push(result)
        state.operationPending = null
        state.operationArity = null
      }

      return state
    }
  },
  operation: {
    next: [
      'number',
    ],
    transitionIf: (token, state, operations) => {
      for (const o in operations) {
        if (operations[o].token === token) return true
      }

      return false
    },
    stateMutator: (token, state, operations) => {
      const operation = findOperation(operations, token)
      state.operationPending = operation.do
      state.operationArity = operation.arity

      return state
    }
  },
  end: {
    next: null,
    transitionIf: token => token === '?'
  }
}

// default operations for the FSM
const defaultOperations = {
  addition: {
    token: 'plus',
    arity: 2,
    do: (a, b) => a + b
  },
  subtraction: {
    token: 'minus',
    arity: 2,
    do: (a, b) => a - b
  },
  multiplication: {
    token: 'multiplied_by',
    arity: 2,
    do: (a, b) => a * b
  },
  division: {
    token: 'divided_by',
    arity: 2,
    do: (a, b) => a / b
  },
}

class Wordy {
  constructor(problem) {
    this.wsm = new WordyStateMachine(defaultTransitions, defaultOperations)
    this.problem = problem.toLowerCase()
                          .replace(/ is/g, '_is')
                          .replace(/ by/g, '_by')
                          .replace(/\?/g, ' ?')
                          .split(' ')
  }

  answer() {
    return this.wsm.run(this.problem)
  }
}

class WordyStateMachine {
  constructor(transitions, operations) {
    this.transitions = transitions
    this.operations = operations
    this.startingState = 'start'
  }

  run(problem) {
    const state = {
      state: this.startingState,
      stack: [],
      operationPending: null,
      operationArity: null
    }

    // Bind the function to add the extra arguments
    const boundRunMachine = runMachine.bind(this, this.transitions, this.operations)
    const finalState = problem.reduce(boundRunMachine, state)

    return finalState.stack.pop()
  }
}

function runMachine(transitions, operations, state, token) {
  const nextPossibleStates = transitions[state.state].next
  state.previousState = state.state
  state.state = nextPossibleStates.find(n => transitions[n].transitionIf(token, state, operations))

  if (state.state === undefined) throw new ArgumentError("malformed problem statement")
  if (state.state === 'end') return state

  state = transitions[state.state].stateMutator(token, state, operations)

  return state
}

function findOperation(operations, token) {
  for (const o in operations) {
    if (operations[o].token === token) return Object.assign({name: o}, operations[o])
  }

  return undefined
}

export { Wordy as WordProblem, ArgumentError };
