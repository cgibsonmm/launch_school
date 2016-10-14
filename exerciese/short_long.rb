def short_long_short(str_1, str_2)
  long = str_1.length > str_2.length ? str_1 : str_2
  short = str_1.length < str_2.length ? str_1 : str_2
  p short + long + short
end

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
