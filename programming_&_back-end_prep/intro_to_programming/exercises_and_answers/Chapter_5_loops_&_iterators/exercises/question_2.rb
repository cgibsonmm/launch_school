# 2. Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

ans = ''
while ans != 'STOP'
  puts "How are you today? - Type 'STOP' to exit"
  ans = gets.chomp
end
