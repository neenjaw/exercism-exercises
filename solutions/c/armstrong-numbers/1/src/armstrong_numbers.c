#include "armstrong_numbers.h"

int is_armstrong_number(int candidate)
{
  int digitCount = 0;
  int digits[7];

  int num = candidate;
  do
  {
    digits[digitCount] = num - (num / 10 * 10);
    digitCount++;
    num /= 10;
  } while (num != 0);

  int sum = 0;
  for (int i = 0; i < digitCount; i++)
  {
    sum += power(digits[i], digitCount);
  }

  return sum == candidate;
}

int power(int base, int exp)
{
  int result = 1;
  while (exp != 0)
  {
    result *= base;
    --exp;
  }

  return result;
}
