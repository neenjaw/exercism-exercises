"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

from enum import StrEnum, auto

class ListClassification(StrEnum):
    SUBLIST = auto()
    SUPERLIST = auto()
    EQUAL = auto()
    UNEQUAL = auto()

SUBLIST = ListClassification.SUBLIST
SUPERLIST = ListClassification.SUPERLIST
EQUAL = ListClassification.EQUAL
UNEQUAL = ListClassification.UNEQUAL

def sublist(list_one: list[int], list_two: list[int]) -> ListClassification:
    """
    Determine the classification of list_one in relation to list_two

    :param list_one: list[int] - list of integers
    :param list_two: list[int] - list of integers
    :return: ListClassification - return the classification of list_one relative to list_two
    """
    
    if list_one == list_two:
        return ListClassification.EQUAL
    if is_contained_in(list_one, list_two):
        return ListClassification.SUBLIST
    if is_contained_in(list_two, list_one):
        return ListClassification.SUPERLIST      
    return ListClassification.UNEQUAL

def is_contained_in(small: list[int], large: list[int]) -> bool:
    """
    determine if the small list is contained in the large using the Knuth-Morris-Pratt alorithm

    :param small: list[int] - the list to check if contained in the large
    :param large: list[int] - the list to check if contains the small
    :return: bool - if the small list is contained in the big list
    """
    
    if not small:
        # small list is empty, therefore contained
        return True
    if len(small) > len(large):
        # small list isn't small, therefore cannot be contained
        return False

    longest_prefix_suffix = get_lps(small)
    large_idx = 0 # index for large list
    small_idx = 0 # index for small list

    while large_idx < len(large):
        if small[small_idx] == large[large_idx]:
            # if the small matches the large, advance
            large_idx += 1
            small_idx += 1

        if small_idx == len(small):
            # if done iterating the small index, it is contained
            return True
        if large_idx < len(large) and small[small_idx] != large[large_idx]:
            # if not done and the small doesn't match the large
            if small_idx != 0:
                # if we need to reset our memory of the small, use the lps to reset
                small_idx = longest_prefix_suffix[small_idx - 1]
            else:
                large_idx += 1

    return False

def get_lps(pattern: list[int]) -> list[int]:
    """
    obtain the longest_prefix_suffix [lps] list according to the Knuth-Morris-Pratt algorithm

    Starting with the second item in the pattern list, compare it to the item at the position 'length'
    If they are they same, increment the pattern counter at 'length' and advance i.
    If they are different:
        If length is not 0 (some amount of pattern so far):
            reset the length to the value in the 'lps' for the position previous
        If length is zero,:
            set the 'lps' at i to 0 (reset the pattern counter)
            advance the pattern index

    :param pattern: list[int] - the input pattern
    :return: list[int] - the lps list
    """
    lps = [0] * len(pattern)
    repetition_length = 0
    pattern_idx = 1 # start at index 1 because we are tracking repetition in the pattern

    while pattern_idx < len(pattern):
        # if there is a repetition (length is less than i, so we are looking backwards)
        if pattern[pattern_idx] == pattern[repetition_length]:
            repetition_length += 1
            lps[pattern_idx] = repetition_length
            pattern_idx += 1
        else:
            if repetition_length != 0:
                repetition_length = lps[repetition_length - 1]
            else:
                lps[pattern_idx] = 0
                pattern_idx += 1

    return lps