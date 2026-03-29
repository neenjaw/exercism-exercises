"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

from typing import Final

EXPECTED_BAKE_TIME: Final[int] = 40
PREPARATION_MINTUTES_PER_LAYER: Final[int] = 2

def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers: int) -> int:
    """Calculate the preparation time for a given number of layers.

    :param number_of_layers: int - number of layers.
    :return: int - preparation time for the number of layers.
    """

    return PREPARATION_MINTUTES_PER_LAYER * number_of_layers

def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """Calculate the preparation time for a given number of layers.

    :param number_of_layers: int - number of layers.
    :param elapsed_bake_time: int - time spent baking.
    :return: int - the total amount of time spent baking.
    """
    
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
