"""
Module to explore the Collatz Conjecture
"""

def steps(number: int) -> int:
    """
    Given a number, return the number of steps it takes to reach an answer of 1.

    Each step is determined by:
      - if even, divide by two
      - if odd, multiply by three and add one.

    :param number: int - the starting integer
    :return: int - the number of steps
    """

    if number < 1 or isinstance(number, float):
        raise ValueError("Only positive integers are allowed")
    
    steps = 0

    while number != 1:
        steps += 1
        number = number//2 if number % 2 == 0 else (number * 3) + 1
        
    return steps 
