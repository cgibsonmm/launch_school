# 1. Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.

# 1. (32 * 4) >= 129  #false
# 2. false != !true  #false
# 3. true == 4       #false
# 4. false == (847 == '874')  #true
# 5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # True


# 2. Write a method that takes a string as argument. The method should return the all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD".

def all_caps(string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts all_caps("hello world")
puts all_caps("hello")

# 4. What will each block of code below print to the screen? Write your answer on a piece of paper or in a text editor and then run each block of code to see if you were correct.

# 1. puts false
# 2. puts "Did you get it right?"
# 3. puts "Alright now!"

# 6. you need to insert another end after the if statement.
