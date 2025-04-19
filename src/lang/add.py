from constants import keywords

def add_numbers(number_a, number_b):
    if isinstance(number_a, int) and isinstance(number_b, int):
        print(number_a + number_b)
    elif isinstance(number_a, int) and isinstance(number_b, list):
        number_b.append(number_a)
        print(number_b)

    return 0

