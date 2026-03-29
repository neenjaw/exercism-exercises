#include <stdbool.h>

#ifndef HAMMING_H
#define HAMMING_H

#define HAMMING_ERROR -1

int compute(const char *lhs, const char *rhs);
bool isEitherFinished(const char *lhs, const char *rhs, int position);
bool isOnlyOneFinished(const char *lhs, const char *rhs, int position);
bool isDifferent(const char *lhs, const char *rhs, int position);

#endif

#ifndef NULL
#define NULL 0
#endif