# 2. Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

h1 = {name: "Corey", place: "Brooklyn"}
h2 = {name: "James", place: "Jeffersonville"}

puts h1.merge(h2)
puts h1
# not using the Bang! will leave the origanal hash unchanged in memory.

puts h1.merge!(h2)
puts h1
# while using the Bang will make a perm change to hash in memory. 
