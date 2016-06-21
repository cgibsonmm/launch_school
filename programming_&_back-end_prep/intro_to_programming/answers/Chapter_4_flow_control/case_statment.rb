puts "Chose a number between 1 - 100"
number = gets.chomp.to_i

def if_number(number)
  if number <= 50
    puts "#{number} is between 50"
  elsif number <= 100
    puts "#{number} is between 51 - 100"
  else
    puts "#{number} is above 100"
  end
end

def case_number(number)
  case
  when number <= 50
    puts"#{number} is less then 50"
  when number <= 100
    puts "#{number} is between 51 -100"
  else
    puts "your number is negetive or greater then 100"
  end
end

if_number(number)

case_number(number)
