#include "grains.h"

uint64_t square(uint8_t index)
{
  if (index == 0 || index > 64) return GRAINS_DOES_NOT_EXIST;

  return (uint64_t) 1 << (index - 1);
}

uint64_t total(void)
{
  uint64_t total = 0;
  uint64_t square = FIRST_SQUARE_GRAIN_VALUE;
  for (int i = BOARD_MIN; i <= BOARD_MAX; i++, square *= 2)
  {
    total += square;
  }

  return total;
}