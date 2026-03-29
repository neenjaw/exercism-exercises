#include "word_count.h"

int word_count(const char *input_text, word_count_word_t * words)
{
  memset(words, 0, sizeof(word_count_word_t) * MAX_WORDS);     // clear to start with a known value

  int position = 0;
  int length = 0;
  int count = 0;
  bool in_word = false;
  while (input_text[position] != '\0')
  {
    bool word_char = (bool) (isalnum(input_text[position]) || isquote(input_text[position]));

    if (word_char) {
      if (count >= MAX_WORDS) return EXCESSIVE_NUMBER_OF_WORDS;

      in_word = true;
      length++;

      if (length > MAX_WORD_LENGTH) return EXCESSIVE_LENGTH_WORD;
    }
    else {
      if (in_word) {
        in_word = false;
        handle_word(input_text + position - length, length, words, &count);
        length = 0;
      }
    }

    position++;
  }

  if (in_word) {
    handle_word(input_text + position - length, length, words, &count);
  }

  return count;
}

bool isquote(const char c) {
  return c == '\'';
}

void handle_word(const char *word, int length, word_count_word_t * words, int *word_count) {
  // remove surrounding quotes
  if (isquote(word[0]) && isquote(word[length-1])) {
    handle_word(word+1, length - 2, words, word_count);
    return;
  }

  // look for word in words
  int i;
  bool found = false;
  for (i = 0; i < *word_count; i++) {
    if (strncasecmp(words[i].text, word, length) == 0) {
      found = true;
      break;
    }
  }

  if (found) {
    words[i].count++;
  }
  else {
    add_word(word, length, words, *word_count);
    (*word_count)++;
  }
}

void add_word(const char *word, int length, word_count_word_t * words, int word_count) {
  strncpy(words[word_count].text, word, length);

  char * text = words[word_count].text;
  for(int i = 0; text[i]; i++){
    text[i] = tolower(text[i]);
  }

  words[word_count].count = 1;
}
