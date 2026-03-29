#include "isogram.h"

bool is_isogram(const char phrase[])
{
  if (phrase == NULL) return false;

  const char *alpha = ""
    "abcdefghijklmnopqrstuvwxyz"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  char ch, used[26] = {0};

  while ((ch = *phrase++) != '\0') {
    const char *p;
    int idx;

    if ((p = strchr(alpha, ch)) == NULL)
      continue;

    idx = (p - alpha) % 26;

    if (used[idx])
      return false;

    used[idx] = true;
  }

  return true;
}

