const UNKNOWN_ERR = 'Invalid nucleotide in strand'

export class NucleotideCounts {
  static parse(s = "") {
    const strand = s.split('');
    const histogram = {
      A: 0,
      C: 0,
      T: 0,
      G: 0,
    }

    strand.reduce((histogram, nucleotide) => {
      if (histogram[nucleotide] === undefined) throw new Error(UNKNOWN_ERR)

      histogram[nucleotide]++;

      return histogram;
    }, histogram)

    return `${histogram.A} ${histogram.C} ${histogram.G} ${histogram.T}`;
  }
}
