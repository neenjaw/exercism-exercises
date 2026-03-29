export class List {
  constructor(array = []) {
    this.values = array;
  }

  append(list) {
    return new List([...this.values, ...list.values]);
  }

  concat(listOfLists) {
    const values = [...this.values]

    const doConcat = (acc, list) => {
      return [...acc, ...list.values]
    }

    return new List(listOfLists.foldl(doConcat, values))
  }

  filter(f) {
    const filterFunction = (acc, e) => {
      if (f(e)) return [...acc, e]

      return acc
    }

    return new List(this.foldl(filterFunction, []))
  }

  map(f) {
    const mapFunction = (acc, e) => {
      return [...acc, f(e)]
    }

    return new List(this.foldl(mapFunction, []))
  }

  length() {
    return this.foldl(acc => ++acc, 0)
  }

  foldl(f, acc) {
    let values = [...this.values]
    if (acc === undefined) {
      [acc, ...values] = values
    }

    const doFold = (values, acc, f) => {
      const [head, ...tail] = values

      return head ?
        doFold(tail, f(acc, head), f) :
        acc;
    }

    return doFold(values, acc, f);
  }

  foldr(f, acc) {
    return this.reverse().foldl(f, acc)
  }

  reverse() {
    const pushElementToAcc = (acc, e) => {
      acc = [e, ...acc]
      return acc
    }

    return new List(this.foldl(pushElementToAcc, []))
  }
}
