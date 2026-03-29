const INVALID_SIDE_ERR = 'sides must be of positive length';
const TRIANGLE_INEQUALITY_ERR = 'sides violate triangle inequality';

export class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  kind() {
    const sides = [...this.sides];
    const sorter = (a,b) => a-b;
    sides.sort(sorter)

    if (sides[0] <= 0) {
      throw new Error(INVALID_SIDE_ERR);
    }
    if ((sides[0] + sides[1]) < sides[2]) {
      throw new Error(TRIANGLE_INEQUALITY_ERR);
    }

    const [a,b,c] = [...sides];

    if (a === b && b === c && a === c) return 'equilateral';
    if (a === b) return 'isosceles';
    if (b === c) return 'isosceles';

    return 'scalene'
  }
}
