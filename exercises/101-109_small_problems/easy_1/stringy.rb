def stringy(int)
  binary = []

  int.times do |i|
    num = i.odd? ? 0 : 1
    binary << num
  end
  binary.join("")
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
