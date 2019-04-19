# split the string into array of words
# reverse the array
# make string of that array
# return that string

def reverse_sentence(string)
  string.split(" ").reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'