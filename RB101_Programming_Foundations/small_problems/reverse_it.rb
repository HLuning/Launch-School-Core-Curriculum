# split the string into array of words
# reverse the array
# make string of that array
# return that string

def reverse_sentence(string)
  string.split(" ").reverse.to_s
end

p reverse_sentence("try this one")