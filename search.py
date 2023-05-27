def search_strings(direction, strings, partial_match=False):

    direction = direction.lower()
    strings = (string.lower() for string in strings)

    if partial_match:
        matches = (string for string in strings if any(direction in word or word in direction for word in string.split()))
    else:
        matches = (string for string in strings if string == direction)

    return list(matches)