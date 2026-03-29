import { strict } from "assert";

const isLetter = (char) => char.match(/[a-z]/i)

export const isPangram = (candidateString) => {
  const candidateLetters = candidateString
                            .toLowerCase()
                            .split("")
                            .filter(isLetter);

  const letterSet = new Set(candidateLetters);

  return letterSet.size == 26
};
