"""
Module for calculating the number of grains related to squares on a board.
"""

def square(number: int) -> int:
    """
    Given a number of squares, calculate how many grains of rice are on the last square.

    :param number: int - the number of squares on the board
    :return: int - the number of grains on the last square
    """
    if not 1 <= number <= 64:
        raise ValueError("square must be between 1 and 64")
        
    return 2 ** (number - 1)


def total():
    """
    Given a board of maximum size (64 squares), return the number of grains on the board.

    :return: int - the number of grains on the board
    """
    return 2 ** 64 - 1
