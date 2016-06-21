a = (1..10).to_a

b = []
a.each do |n|
  b << n + 2
end
p a
p b
