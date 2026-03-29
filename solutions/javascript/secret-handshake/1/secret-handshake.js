const WINK = 0b1
const DOUBLE_BLINK = 0b10
const CLOSE_EYES = 0b100
const JUMP = 0b1000
const REVERSE = 0b10000

export const commands = (code) => {
  const actions = [
    WINK,
    DOUBLE_BLINK,
    CLOSE_EYES,
    JUMP,
  ]

  const commands = actions
    .filter(actionCode => checkCode(code, actionCode))
    .map(actionCode => getAction(actionCode))

  if (checkCode(code, REVERSE)) commands.reverse()

  return commands
}

const checkCode = (code, actionCode) => {
  return (code & actionCode) !== 0
}

const getAction = (actionCode) => {
  switch (actionCode) {
    case WINK:
      return 'wink'
    case DOUBLE_BLINK:
      return 'double blink'
    case CLOSE_EYES:
      return 'close your eyes'
    case JUMP:
      return 'jump'
  }
}