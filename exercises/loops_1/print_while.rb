# Using a while loop, print 5 random numbers between 0 and 99. The code
# below shows an example of how to begin solving this exercise.

# numbers = []

# while <condition>
#   # ...
# end

# My way
# numbers = (0..99).to_a
# count = 0
#
# while count < 5
#   puts numbers.sample
#   count += 1
# end

numbers = []

numbers << rand(100) while numbers.size < 5

puts numbers
