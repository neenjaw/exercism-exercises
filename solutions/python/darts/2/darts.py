"""Module for scoring darts"""

import math

OUTER_RIM = 10
MIDDLE_RIM = 5
INNER_RIM = 1

def score(x_coord: int, y_coord: int) -> int:
    """
    Score a dart throw based on the x, y coodinate relative to the bullseye.

    :param x_coord: int - x coordinate
    :param y_coord: int - y coordinate
    """

    distance = math.sqrt(x_coord ** 2 + y_coord ** 2)

    if OUTER_RIM < distance:
        return 0
    if MIDDLE_RIM < distance <= OUTER_RIM:
        return 1
    if INNER_RIM < distance <= MIDDLE_RIM:
        return 5
    if distance <= INNER_RIM:
        return 10
        
