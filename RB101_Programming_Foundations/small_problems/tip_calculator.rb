puts "What is the amount of the bill? "
bill = gets.chomp.to_f

puts "What is the tip percentage? ( f.e. enter '5' for 5% ) "
percentage = (gets.chomp.to_f) / 100

tip = (bill * percentage).round(2)
total = (bill + tip).round(2)

puts "The tip is €#{tip}."
puts "The total is €#{total}."