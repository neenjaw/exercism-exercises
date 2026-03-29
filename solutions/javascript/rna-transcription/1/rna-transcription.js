export const toRna = (strand) => {
  return Array.prototype.map.call(strand, nucleotide => {
    return toComplement(nucleotide);
  })
  .join('');
};

export const toComplement = (nucleotide) => {
  // G -> C
  if (nucleotide === 'G') return 'C';
  // C -> G
  if (nucleotide === 'C') return 'G';
  // T -> A
  if (nucleotide === 'T') return 'A';
  // A -> U
  if (nucleotide === 'A') return 'U';

  throw "Invalid nucleotide.";
};