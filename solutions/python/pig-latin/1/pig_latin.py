"""Module to translate to pig latin"""

import re

def translate(text: str) -> str:
    """
    Translate a string to pig latin word by word

    :param text: str - the text to translate
    :return: str - the translated result in pig latin
    """

    parts = re.split(r'(\s+)', text)

    processed = [translate_word(word) if not word.isspace() else word for word in parts]
    
    return "".join(processed)

def translate_word(word: str) -> str:
    if any(word.startswith(prefix) for prefix in "a e i o u xr yt".split()):
        return word + "ay"
    
    qu_pattern = r'^(?P<prefix>[b-df-hj-np-tv-z]+)?qu(?P<suffix>\w+)$'
    match = re.search(qu_pattern, word)

    if match:
        prefix = match.group("prefix") or ""
        return match.group("suffix") + prefix + "quay" 

    y_pattern = r'^(?P<prefix>[b-df-hj-np-tv-z]+)y(?P<suffix>\w+)$'
    match = re.search(y_pattern, word)

    if match:
        return "y" + match.group("suffix") + match.group("prefix") + "ay"
    
    consonant_pattern = r'^(?P<prefix>[b-df-hj-np-tv-z]+)(?P<suffix>\w+)$'
    match = re.search(consonant_pattern, word)
    
    if match:
        return match.group("suffix") + match.group("prefix") + "ay" 

    raise ValueError("matched nothing")
