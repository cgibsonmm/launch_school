# 1. Add two strings together that, when concatenated, return your first and last name as your full name in one string.
puts "Corey " + "Gibson"

# # 2. Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the:
#  thousands = 9810 /1000
#  hundreds = 9810 % 1000 /100
#  tens =  9810 %1000 %100 / 10
#  ones =  9810 %1000 %100 %10


 # 3. Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.

 movies = {jurrasic_park: 1993,
            shaun_of_the_dead: 2005}

puts movies[:jurrasic_park]
puts movies[:shaun_of_the_dead]


# 4. Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3

years = [1975, 2004, 2013, 2001, 1989]

puts years

# 5. Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1


# 6. Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.
puts 5.78 * 5.76
puts 18.78 * 18.78
puts 24.54 * 24.54

# 7. What does the following error message tell you?

# SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'

#    from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# The code is missing a ) at the end of line 2
