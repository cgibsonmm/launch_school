x = 0
3.times do
  x += 1
end
puts x

# x is 3


y = 0
3.times do
  y += 1
  x = y
end
puts x

# gives error when run from seprate files. x is undefined gloabaly and only defined as a local varible.

# 6. Shoes is not defined on line 3
