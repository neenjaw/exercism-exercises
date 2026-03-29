const UNEQUAL_ERR = 'left and right strands must be of equal length';
const LEFT_EMPTY_ERR = 'left strand must not be empty'
const RIGHT_EMPTY_ERR = 'right strand must not be empty'

export const compute = (left, right) => {
  const leftStrand = left.split('');
  const rightStrand = right.split('');

  if (leftStrand.length === 0 && rightStrand.length > 0) throw new Error(LEFT_EMPTY_ERR);
  if (rightStrand.length === 0 && leftStrand.length > 0) throw new Error(RIGHT_EMPTY_ERR);
  if (leftStrand.length !== rightStrand.length) throw new Error(UNEQUAL_ERR);

  return leftStrand.reduce((d, _, i) => {
    if (leftStrand[i] !== rightStrand[i]) {
      return d + 1;
    }

    return d;
  }, 0);
};
