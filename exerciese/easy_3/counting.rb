puts "Please write a word or multiple words:"
string = gets.chomp

total = string.delete(' ').size
puts "There are #{total} characters in #{string}."
