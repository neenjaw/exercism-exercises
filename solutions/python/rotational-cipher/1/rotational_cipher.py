"""Module to rotate text"""

import string

def rotate(text: str, shift: int) -> str:
    """
    Encodes or decodes a string using the ROT13 substitution cipher.

    This function shifts every alphabetic character by 13 places in the 
    alphabet while preserving case. Non-alphabetic characters remain unchanged.

    :param text: str - The string to be transformed.
    :param shift: int - The amount to shift the string.
    :return: str - The ROT13 transformed string.
    """
    
    method_a = rotateiter(text, shift)
    method_b = rotatetrans(text, shift)

    if method_a != method_b:
        raise ValueError(f"Methods varied, a:{method_a}, b:{method_b}")

    return method_a

def rotateiter(text: str, shift: int) -> str:
    """
    Encodes or decodes a string using the ROT13 substitution cipher.

    This function shifts every alphabetic character by 13 places in the 
    alphabet while preserving case. Non-alphabetic characters remain unchanged.

    :param text: str - The string to be transformed.
    :param shift: int - The amount to shift the string.
    :return: str - The ROT13 transformed string.
    """

    if shift == 0:
        return text
    
    result: str = ""
    for char in text:
        if 'a' <= char <= 'z':
            # Shift within lowercase range (ASCII 97-122)
            result += chr((ord(char) - ord('a') + shift) % 26 + ord('a'))
        elif 'A' <= char <= 'Z':
            # Shift within uppercase range (ASCII 65-90)
            result += chr((ord(char) - ord('A') + shift) % 26 + ord('A'))
        else:
            # Preserve spaces, punctuation, and digits
            result += char
    return result

def rotatetrans(text: str, shift: int) -> str:
    """
    Encodes or decodes a string using the ROT13 substitution cipher.

    This function shifts every alphabetic character by 13 places in the 
    alphabet while preserving case. Non-alphabetic characters remain unchanged.

    :param text: str - The string to be transformed.
    :param shift: int - The amount to shift the string.
    :return: str - The ROT13 transformed string.
    """

    shift %= 26
    lc_base = string.ascii_lowercase
    lc_shifted = lc_base[shift:] + lc_base[:shift]

    uc_base = string.ascii_uppercase
    uc_shifted = uc_base[shift:] + uc_base[:shift]

    table = str.maketrans(lc_base + uc_base, lc_shifted + uc_shifted)
    return text.translate(table)
    