import { strict } from "assert";

const isLetter = (char) => char.match(/[a-z]/i)

export const isPangram = (candidateString) => {
  const candidateNormalized = candidateString.toLowerCase()
  const candidateLetters = [...candidateNormalized].filter(isLetter);
  const letterSet = new Set(candidateLetters);

  return letterSet.size == 26
};
