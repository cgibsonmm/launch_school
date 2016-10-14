numbers = []

puts "Enter your first number."
numbers << gets.chomp.to_i

puts "Enter your second number."
numbers << gets.chomp.to_i

puts "Enter your third number."
numbers << gets.chomp.to_i

puts "Enter your fourth number."
numbers << gets.chomp.to_i

puts "Enter your fifth number."
numbers << gets.chomp.to_i

puts "Enter the last number."
control = gets.chomp.to_i

if numbers.include?(control)
  puts "The number #{control} appears in #{numbers}."
else
  puts "The number #{control} does not appear in #{numbers}"
end
