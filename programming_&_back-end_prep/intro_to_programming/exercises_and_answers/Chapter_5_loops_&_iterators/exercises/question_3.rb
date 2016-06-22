# 3. Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

arr = ["Corey", "James", "Jessica", "Collin", "Cameron"]

arr.each_with_index do |name, index|
  puts "Hello #{name} you're number: #{index}"
end
