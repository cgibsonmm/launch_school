def reverse_sentence(str)
  to_reverse = str.split(' ')
  size = to_reverse.length
  new_string = []

  size.times do
    new_string << to_reverse.pop
  end
  new_string.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
