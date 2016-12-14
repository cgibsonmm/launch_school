# Write a method that takes a year as input
# and returns the century. The return value
# should be a string that begins with the
# century number, and ends with st, nd, rd
# or th as appropriate for that number.

# New centuries begin in years that end with
# 01. So, the years 1901-2000 comprise the
# 20th century.

def century(year)
  corect_cen = year / 100
  unless year.to_s.end_with?('0')
    corect_cen += 1
  end

  cent_str = corect_cen.to_s
  if cent_str.end_with?('1')
    puts cent_str + 'st'
  elsif cent_str.end_with?('2')
    puts cent_str + 'nd'
  elsif cent_str.end_with?('3')
    puts cent_str + 'rd'
  else
    puts cent_str + "th"
  end
end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
