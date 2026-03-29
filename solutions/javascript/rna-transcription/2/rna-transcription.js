export const complementPairs = [
  ["G", "C"],
  ["C", "G"],
  ["T", "A"],
  ["A", "U"],
];

export const complementMap = new Map(complementPairs);

export const toComplement = nucleotide => complementMap.get(nucleotide);

export const toRna = (strand) => {
  return strand.split("")
               .map(nucleotide => toComplement(nucleotide))
               .join("");
};
