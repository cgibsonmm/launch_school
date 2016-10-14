def oddities(arr)
  ret_arr = []

  arr.each_with_index do |item, index|
    ret_arr << item if index.even?
  end
  ret_arr
end

p oddities([2, 3, 4, 5, 6])
p oddities(%w(abc def))
p oddities([123])
p oddities([])
