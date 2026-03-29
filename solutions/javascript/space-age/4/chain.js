export default class Chain {
  constructor(value) {
    this.value = value;
  }

  chain(fn, ...args) {
    this.value = fn.apply(null, [this.value, ...args]);

    return this;
  }
}