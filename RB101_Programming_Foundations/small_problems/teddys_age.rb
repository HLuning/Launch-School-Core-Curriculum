puts "Please enter a name: "
name = gets.chomp

if name == ""
  name = "Teddy"
end

puts "#{name} is #{rand(20..200)} years old!"