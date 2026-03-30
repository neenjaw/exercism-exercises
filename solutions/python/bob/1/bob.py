def response(hey_bob: str) -> str:
    hey_bob = hey_bob.strip()
    ends_in_question = hey_bob.endswith("?")
    all_downcase = hey_bob.lower() == hey_bob
    all_uppercase = hey_bob.upper() == hey_bob and not all_downcase 
    empty = hey_bob == ""

    if ends_in_question and all_uppercase:
        return "Calm down, I know what I'm doing!"
    if ends_in_question:
        return "Sure."
    if all_uppercase:
        return "Whoa, chill out!"
    if empty:
        return "Fine. Be that way!"

    return "Whatever."
