//
// Matrix class describing a matrix and matrix operations.
//

export class Matrix {
  // Constructor, accepts a stringified matrix
  //   '\n' demarcates new row,
  //   ' ' demarcates new column
  constructor(stringifiedMatrix) {
    this.data = stringifiedMatrix
                  .split('\n')
                  .map(r => r.split(' ').map(c => Number(c)));
  }

  get rows() {
    return this.data;
  }

  get columns() {
    return transposeMatrix(this);
  }
}

function transposeMatrix(matrix) {
  return matrix.data[0]
               .map((_,c) => matrix.data.map(row => row[c]));
}