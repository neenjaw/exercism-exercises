export const complementMap = {
  G: 'C',
  C: 'G',
  T: 'A',
  A: 'U'
};

export const toComplement = nucleotide => complementMap[nucleotide];

export const toRna = (strand) => {
  return strand.split("")
               .map(nucleotide => toComplement(nucleotide))
               .join("");
};
