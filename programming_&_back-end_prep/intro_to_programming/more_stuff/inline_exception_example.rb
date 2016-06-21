# inline_excaption_example.rb

zero = 0
puts "Before each call"
zero.each { |e| puts e} rescue puts "Cant do that!"
puts "After each call"
