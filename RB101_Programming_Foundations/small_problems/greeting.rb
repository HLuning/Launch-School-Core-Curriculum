puts "What's your name? "
user_name = gets.chomp

if user_name.end_with?('!')
  puts "HELLO #{user_name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{user_name.capitalize}."
end