export const isLeap = (year) => {
  if (year % 4 != 0) return false;
  if (year % 2000 == 0) return true;
  if (year % 100 == 0) return false;
  return true;
};
