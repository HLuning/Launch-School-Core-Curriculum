def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# further exploration

def palindromic?(string_or_array)
  string_or_array == string_or_array.reverse
end

p palindromic?([3, 5, 8, 3]) == false
p palindromic?(['hi', 3, 5, 3, 'hi']) == true
p palindromic?('madam') == true

def real_palindrome?(string)
  cleanstring = string.downcase.chars

  cleanstring.select! { |char| ('a'..'z').include?(char) || ('0'..'9').include?(char) }

  cleanstring.reverse == cleanstring
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true          
p real_palindrome?("madam i'm adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('5736374') == false

