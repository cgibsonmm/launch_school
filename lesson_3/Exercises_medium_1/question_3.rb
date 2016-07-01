# 3. The result of the following statement will be an error:

 # puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?
# you are printing a string and a fixnum to the same line, which can not be concatenated.
# to fix:

puts "the value of 40 + 2 is " + (40 + 2).to_s

# or:

puts "the value of 40 + 2 is #{40 + 2}"
