def count_chars(string)
  char_array = []
  string.each_char do |char|
    if char == ' '
      next
    else
      char_array << char
    end
  end

  char_array.count
end

print "Please write a word or multiple words: "
user_input = gets.chomp

puts "There are #{count_chars(user_input)} characters in #{user_input}."
