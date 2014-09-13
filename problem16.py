def digit_sum(number):
    heading_digits = number
    result = 0
    while heading_digits > 0:
        factor = 10
        trailing_digit = heading_digits % factor
        result += trailing_digit
        heading_digits /= factor
    return result

print digit_sum(2 ** 1000)
