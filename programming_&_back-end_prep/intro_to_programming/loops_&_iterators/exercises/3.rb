my_array = ("Corey Kevin Jacob Chris John").split

puts my_array.inspect

my_array.each_with_index do |name, index|
  puts "Your name is #{name} and your index is #{index}"
end
