#include "square_root.h"

uint16_t squareRoot(uint16_t radicand)
{
  if (radicand == 0 || radicand == 1)
    return radicand;

  int start = 1, end = radicand, ans;
  while (start <= end)
  {
    int middle = (start + end) / 2;

    if (middle * middle == radicand)
      return middle;

    if (middle * middle < radicand)
    {
      start = middle + 1;
      ans = middle;
    }
    else
    {
      end = middle - 1;
    }
  }
  return ans;
}
