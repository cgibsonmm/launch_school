loop do
  hash = {}
  index = 0
  8.times do
    mountain_h = gets.to_i # represents the height of one mountain.
    hash[index] = mountain_h
    index += 1
  end

  puts "________"
  puts hash.key(hash.values.max)
  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  # The index of the mountain to fire on.
end
