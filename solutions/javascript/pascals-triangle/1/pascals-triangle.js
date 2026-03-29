// Triangle is a class representing pascal's triangle, the constructor
// taking a natural number to determine how many rows to compute.
export class Triangle {
  constructor(rowsToCompute) {
    this.data = makeRows(rowsToCompute)
  }

  get lastRow() {
    return this.data[this.data.length - 1];
  }

  get rows() {
    return this.data;
  }
}

// Compute 'n' rows of pascals triangle.
// For each row, take the previous row, buffer it with zeros then
// calculate the next row finally adding it to the list of rows.
const makeRows = n => {
  const rows = [[1]];

  while (n > 1) {
    const buildFrom = [0, ...rows[rows.length - 1], 0];
    const newRow = [];

    for (let i = 0; (i + 1) < buildFrom.length; i++) {
      newRow.push(buildFrom[i] + buildFrom[i+1]);
    }

    rows.push(newRow);

    n--;
  }

  return rows;
}