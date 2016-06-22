
names = ("bob joe steve janice susan helen").split

x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x+=1
end


puts names.inspect
