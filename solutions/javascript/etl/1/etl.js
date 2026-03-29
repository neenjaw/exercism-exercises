export const transform = (data) => {
  const transformed = {};

  for (let value in data) {
    for (let letter of data[value]) {
      transformed[letter.toLowerCase()] = Number(value)
    }
  }

  return transformed;
};
