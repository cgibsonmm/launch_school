def palindrome?(string)
  p string == string.reverse
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

puts "+" * 15

def real_palindrome?(string)
  to_palirome = string.downcase.delete('^a-z0-9')
  palindrome?(to_palirome)
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false


def palindromic_number?(number)
  palindrome?(number)
end

puts "+" * 10

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
palindromic_number?(0023200) == true
