export const GIGASECOND_IN_MS = 1e9 * 1000;

export const gigasecond = (time) => {
  return new Date(time.getTime() + GIGASECOND_IN_MS);
};
