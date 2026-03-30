"""Module to convert a number to a raindrop sound"""

def convert(number: int) -> str:
    """
    Convert an integer number to a raindrop sound.

    :param number: int - the number to convert
    :return: str - thr raindrop sound
    """
    
    sound_tests: list[tuple[int, str]] = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong")
    ]

    sound = "".join(test[1] for test in sound_tests if number % test[0] == 0)

    return sound if sound else str(number)
