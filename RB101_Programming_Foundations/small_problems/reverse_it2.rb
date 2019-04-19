# split the string into array of words
# iterate over words, if word is longer than 5 chars, reverse it
# join the result

def reverse_words(string)
  array_words = string.split(" ")
  array_words.map! do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end
  array_words.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS