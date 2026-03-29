export const primeFactors = (n) => {
  const factors = [];

  while (n % 2 === 0) {
    factors.push(2);
    n = n / 2;
  }

  for (let f = 3; f <= Math.floor(Math.sqrt(n)); f += 2) {
    while (n % f === 0) {
      factors.push(f);
      n = n / f;
    }
  }

  if (n > 2) factors.push(n);

  return factors;
};
