"""Module for working with ISBN identifiers"""

X_VALUE = 10

def is_valid(isbn: str) -> bool:
    cleaned_chars = [char for char in isbn if char.isalnum()]

    if len(cleaned_chars) != 10:
        return False

    last_char = cleaned_chars[-1]
    if not (last_char.isdigit() or last_char == 'X'):
        return False

    if any(not char.isdigit() for char in cleaned_chars[:-1]):
        return False

    digits = (int(char) if char.isdigit() else X_VALUE for char in cleaned_chars)
    indexes = list(range(10, 0, -1))
    
    return sum(digit * index for digit, index in zip(digits, indexes)) % 11 == 0
