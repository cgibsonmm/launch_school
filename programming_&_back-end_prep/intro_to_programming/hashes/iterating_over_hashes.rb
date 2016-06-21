# iterating_over_hashes.rb

person = {name: 'bob', height: '6ft', weight: '160', hair: 'brown'}


person.each do |k, v|
  puts "Bob's #{k} is #{v}"
  puts "-" * 4
end
