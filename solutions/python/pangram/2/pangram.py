"""Module to determine if a string is a pangram"""

import string

def is_pangram(sentence: str) -> bool:
    """
    Function to determine whether a sentence is a pangram (contains all the letters of the alphabet)

    :param sentence: str - The sentence to test
    :return: bool - whether the sentence is a pangram or not
    """
    
    frequency = {}
    for char in sentence.lower():
        frequency[char] = frequency.get(char, 0) + 1

    return all(frequency.get(char, 0) > 0 for char in string.ascii_lowercase)
