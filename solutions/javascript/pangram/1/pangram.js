import { strict } from "assert";

const isLetter = (char) => char.match(/[a-z]/i)

export const isPangram = (candidateString) => {
  const letterMap = candidateString
                      .split("")
                      .reduce((map, char) => {
                        if (isLetter(char)) {
                          map.set(char.toLowerCase(), true);
                        }

                        return map;
                      }, new Map());

  return letterMap.size == 26
};
