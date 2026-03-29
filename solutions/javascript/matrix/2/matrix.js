//
// Matrix class describing a matrix and matrix operations.
//

export class Matrix {
  // Constructor, accepts a stringified matrix
  //   '\n' demarcates new row,
  //   ' ' demarcates new column
  constructor(stringifiedMatrix) {
    this.matrix = stringifiedMatrix
                    .split('\n')
                    .map(r => {
                      return r.split(' ')
                              .map(c => Number(c))
                    });
  }

  get rows() {
    return this.matrix;
  }

  get columns() {
    return this.transposeMatrix();
  }

  transposeMatrix() {
    return this.matrix[0]
               .map((_,c) => this.matrix.map(row => row[c]));
  }
}
