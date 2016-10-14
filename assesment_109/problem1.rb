# Reverse an array without using the built-in reverse method.
# def reverser(str)
#   to_reverse = str.split('')
#   new_word = []
#
#   str.length.times do
#     new_word << to_reverse.pop
#   end
#   new_word.join('')
# end
# p reverser('hello')

# Select the element out of the array if its index is a fibonacci number.
array = [1, 2, 3, 4, 5]
fib_numbers = array.select { |n| n}

p fib_numbers


# BONUS: Write a method that finds the nth fibonacci number where n is
# the number passed to the method.

# Write a method to determine if a word is a palindrome, without using
# the reverse method.
