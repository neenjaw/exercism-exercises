"""Module to determine triangle identities"""

Number = int | float

def equilateral(sides: list[Number]) -> bool:
    """
    Determine if a triangle has an equilateral identity

    :param sides: list[Number] - a list of the lengths of the sides of a triangle
    """
    
    return (
        has_three_sides(sides) and
        not has_zero_length_side(sides) and
        all(side == sides[0] for side in sides)
    )

def isosceles(sides: list[Number]) -> bool:
    """
    Determine if a triangle has an isosceles identity

    :param sides: list[Number] - a list of the lengths of the sides of a triangle
    """
    
    freqs = triangle_frequencies(sides) 
    
    return (
        has_three_sides(sides) and
        not has_zero_length_side(sides) and
        has_triangle_equality(sides) and
        any(side_length_count >= 2 for side_length_count in freqs.values())
    )


def scalene(sides: list[Number]) -> bool:
    """
    Determine if a triangle has a scalene identity

    :param sides: list[Number] - a list of the lengths of the sides of a triangle
    """
    
    freqs = triangle_frequencies(sides) 

    return (
        has_three_sides(sides) and
        not has_zero_length_side(sides) and
        has_triangle_equality(sides) and
        not any(side_length_count >= 2 for side_length_count in freqs.values())
    )


# Helpers

def triangle_frequencies(sides: list[Number]) -> dict[Number, int]:
    frequencies = {}

    for side in sides:
        frequencies[side] = frequencies.get(side, 0) + 1

    return frequencies

def has_three_sides(sides: list[Number]) -> bool:
    return len(sides) == 3

def has_zero_length_side(sides: list[Number]) -> bool:
    return 0 in sides

def has_triangle_equality(sides: list[Number]) -> bool:
    return all(sum(sides) - side >= side for side in sides)