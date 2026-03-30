"""Module for interacting with a prompt"""

def response(hey_bob: str) -> str:
    """
    Respond to a prompt as Bob.

    :param hey_bob: str - The prompt
    :return: str - Bob's response
    """
    
    processed = hey_bob.strip()

    is_question = processed.endswith("?")
    is_shouting = processed.isupper()
    is_silence = not processed

    if is_shouting and is_question:
        return "Calm down, I know what I'm doing!"
    if is_question:
        return "Sure."
    if is_shouting:
        return "Whoa, chill out!"
    if is_silence:
        return "Fine. Be that way!"

    return "Whatever."
