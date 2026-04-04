"""Module to determine if a string is a pangram"""

import string

def is_pangram(sentence: string) -> bool:
    frequency = {}
    for char in sentence.lower():
        frequency[char] = frequency.get(char, 0) + 1

    return all(frequency.get(char, 0) > 0 for char in string.ascii_lowercase)
