# optional_parameters.rb

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} and I live in #{options[:city]}."
  end
end

greeting('Bob')
greeting('Corey', {age: 26, city: "NYC"})
