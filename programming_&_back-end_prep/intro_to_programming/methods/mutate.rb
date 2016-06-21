# Example of a method theat modifies its arguments permanently
# mutate.rb

a = [1, 2, 3]

def mutate(array)
  array.pop
end

def no_mutate(array)
  array.last
end

p "before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"
