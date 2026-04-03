"""Module to work with perfect numbers"""

from typing import Literal

# This variable can ONLY be "success" or "error"
Classification = Literal["perfect", "abundant", "deficient"]


def classify(number: int) -> Classification:
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """

    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    
    factors = [i for i in range(1, number) if number % i == 0]
    sum_of_factors = sum(factors)

    if sum_of_factors > number:
        return "abundant"
    if sum_of_factors < number:
        return "deficient"

    return "perfect"
    
