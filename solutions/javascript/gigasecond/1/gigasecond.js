export const GIGASECOND = 1e9;

export const gigasecond = (time) => {
  time.setSeconds(time.getSeconds() + GIGASECOND)
  
  return time;
};
