# given, words:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# making a new empty hash for the anagrams

anagrams = Hash.new

words.each do |word|
  if anagrams.has_key?(word.split(//).sort.join)
    anagrams[word.split(//).sort.join] << word 
  else 
    anagrams[word.split(//).sort.join] = [word]
  end
end

anagrams.each do |key, value|
  p value
end