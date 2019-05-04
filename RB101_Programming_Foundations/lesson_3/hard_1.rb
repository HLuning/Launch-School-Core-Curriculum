# question 1

# There is nothing false, so greeting won't be assigned to 'hello world'.
# So, no output or result.

# LS:
# greeting is nil here, and no "undefined method or local variable" exception is thrown. 
# Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. 
# However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, the local
# variable is initialized to nil.


# question 2

'hi there'


# question 3

# A) one, two, three
# B) one, two, three
# C) two, three, one


# question 4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length != 4
    return false
  else dot_separated_words.each do |word|
    if is_an_ip_number?(word) == false
    return false
  end
  true
end

