"""
Module for determining if an integer number is an armstrong number
"""

def is_armstrong_number(number: int) -> bool:
    """
    Given a number, determine if the number is an armstrong number.

    :param number: int - the number to test
    :return: bool - whether the number is an armstrong number or not    
    """
    remaining_number = number
    digits = []

    while remaining_number > 0:
        digits.append(remaining_number % 10)
        remaining_number //= 10

    number_of_digits = len(digits)
    test_number = sum(d ** number_of_digits for d in digits)

    return number == test_number
