# Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.
#
# "laboratory"
# "experiment"
# "Pans Labyrinth"
# "elaborate"
# "polar bear"

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def has_lab(array)
  array.each do |string|
    if string =~ /lab/
      puts string
    else
      puts "No match for 'lab'"
    end
  end
end

has_lab(words)
