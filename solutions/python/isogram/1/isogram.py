"""Module to determine if a string is an isogram"""

def is_isogram(string: str) -> bool:
    """
    Function to determine if a string is an isogram

    :param string: str - string to test
    :return: bool - whether the string is an isogram
    """
    frequency = {}
    
    for char in string.lower():
        if not char.isalpha():
            continue
            
        char_count = frequency.get(char, 0)
        
        if char_count > 0:
            return False

        frequency[char] = char_count + 1

    return True
