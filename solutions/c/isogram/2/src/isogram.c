#include "isogram.h"

bool is_isogram(const char phrase[])
{
  if (phrase == NULL) return false;

  char ch, used[26] = {0};
  while ((ch = *phrase++) != '\0') {
    if (!isalpha(ch))
      continue;

    ch = tolower(ch);
    int idx = ch - 'a';

    if (used[idx])
      return false;

    used[idx] = true;
  }

  return true;
}

