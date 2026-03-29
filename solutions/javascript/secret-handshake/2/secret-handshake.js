export const commands = (code) => {
  const handshake = new Handshake(code)
  return handshake.actions
}

class Handshake {
  constructor(code) {
    const isActionEncoded = getCodeCheckFunction(code)

    const actionCollector = (isActionEncoded(Action.reverseAction()))
                          ? Array.prototype.unshift
                          : Array.prototype.push

    this._actions = []
    Action
      .handshakeActions()
      .forEach(getHandshakeActions(isActionEncoded, actionCollector, this._actions))
  }

  get actions() {
    return [...this._actions]
  }
}

const getCodeCheckFunction = (code) => {
  return (action) => (code & action.code) !== 0
}

const getHandshakeActions = (isActionEncodedFn, actionCollectorFn, actionsCollection) => {
  return (action) => {
    if (isActionEncodedFn(action))
        actionCollectorFn.call(actionsCollection, action.description)
  }
}

class Action {
  constructor(description, code) {
    this.description = description
    this.code = code
  }

  static handshakeActions() {
    return [
      new Action('wink', 0b1),
      new Action('double blink', 0b10),
      new Action('close your eyes', 0b100),
      new Action('jump', 0b1000)
    ]
  }

  static reverseAction() {
    return new Action('reverse', 0b10000)
  }
}