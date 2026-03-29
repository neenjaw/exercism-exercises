#include "hamming.h"

int compute(const char *lhs, const char *rhs)
{
  if (lhs == NULL || rhs == NULL)
    return HAMMING_ERROR;

  int distance = 0;
  int position = 0;
  while (!isEitherFinished(lhs, rhs, position))
  {
    if (isDifferent(lhs, rhs, position)) distance++;
    position++;
  }

  if (isOnlyOneFinished(lhs, rhs, position))
    return HAMMING_ERROR;


  return distance;
}

bool isEitherFinished(const char *lhs, const char *rhs, int position)
{
  if (*(lhs + position) == '\0') return true;
  if (*(rhs + position) == '\0') return true;
  return false;
}

bool isOnlyOneFinished(const char *lhs, const char *rhs, int position)
{
  bool lhsFinished = *(lhs + position) == '\0';
  bool rhsFinished = *(rhs + position) == '\0';

  if (lhsFinished != rhsFinished) return true;
  return false;
}

bool isDifferent(const char *lhs, const char *rhs, int position)
{
  if (*(lhs + position) != *(rhs + position)) return true;
  return false;
}

