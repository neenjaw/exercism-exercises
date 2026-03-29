export class List {
  constructor(array = []) {
    this.values = array;
  }

  append(list) {
    return new List([...this.values, ...list.values]);
  }

  concat(listOfLists) {
    const values = [...this.values]
    listOfLists.values.forEach(list => list.values.forEach(e => values.push(e)))
    return new List(values)
  }

  filter(f) {
    const filterFunction = (acc, e) => {
      if (f(e)) {
        acc.push(e)
      }
      return acc
    }

    return new List(this.foldl(filterFunction, []))
  }

  map(f) {
    const mapFunction = (acc, e) => {
      acc.push(f(e))
      return acc
    }

    return new List(this.foldl(mapFunction, []))
  }

  length() {
    return this.foldl(acc => ++acc, 0)
  }

  foldl(f, acc) {
    const values = [...this.values]

    values.forEach(e => acc = f(acc, e))

    return acc;
  }

  foldr(f, acc) {
    return this.reverse().foldl(f, acc)
  }

  reverse() {
    const pushElementToAcc = (acc, e) => {
      acc.unshift(e)
      return acc
    }

    return new List(this.foldl(pushElementToAcc, []))
  }
}
