#include "armstrong_numbers.h"

static int power(int base, int exp)
{
  int result = 1;
  while (exp != 0)
  {
    result *= base;
    --exp;
  }

  return result;
}

int is_armstrong_number(int candidate)
{
  int digitCount = 0;
  int num = candidate;
  do
  {
    digitCount++;
    num /= 10;
  } while (num != 0);

  int sum = 0;
  for (int i = 0, num = candidate; i < digitCount; i++, num /= 10)
  {
    int digit = num - (num / 10 * 10);
    sum += power(digit, digitCount);
  }

  return sum == candidate;
}


