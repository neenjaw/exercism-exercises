"""Module with function to determine if year is a leap year"""

def leap_year(year: int) -> bool:
    """
    Given a year, determine if it is a leap year

    :param year: int - the year to examine
    :return: bool - whether the year is a leap year
    """
    
    if year >> 2 << 2 != year:
        return False
    if year % 4 != 0:
        return False
    if year % 100 == 0 and year % 400 != 0:
        return False
    return True
