words =  ['demo', 'none', 'tied', 'evil', 'dome',               'mode', 'live','fowl', 'veil', 'wolf', 'diet','vile', 'edit', 'tide','flow', 'neon']

# 1. iterate over arrray .each word
# 2. turn it into abc order
# 3. create key word and appand anograms to word

annogram = {}

words.each do |word|
  key = word.split('').sort.join
  if annogram.has_key?(key)
    annogram[key].push(word)
  else
    annogram[key] = [word]
  end
end

annogram.each do |k,v|
  puts "-----"
  p v
end
