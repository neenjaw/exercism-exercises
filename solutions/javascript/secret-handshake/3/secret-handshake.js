const actions = [
  [ 0b1,     acc => [...acc, "wink"] ],
  [ 0b10,    acc => [...acc, "double blink"] ],
  [ 0b100,   acc => [...acc, "close your eyes"] ],
  [ 0b1000,  acc => [...acc, "jump"] ],
  [ 0b10000, acc => acc.reverse() ]
]

export const commands = (code) =>
  actions.reduce(allActionsToHandshake(code), [])

const allActionsToHandshake = (code) => (handshake, [command, action]) => {
  return (command & code) !== 0 ? action(handshake) : handshake
}